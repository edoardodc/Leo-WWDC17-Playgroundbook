import QuartzCore
import UIKit

public class LeafView: UIView {
    var emitter: CAEmitterLayer = CAEmitterLayer()
    public var intensity: Float!
    private var active: Bool!
    private var imageLeaf: UIImage?
    public var direction: LeafDirection = .top
    
    public enum LeafDirection {
        case top
        case bottom
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLeaf()
    }
    
    func setupLeaf() {
        active = false
        intensity = 0.4
        direction = .top
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLeaf()
    }
    
    func leafWithColor() -> CAEmitterCell {
        let leaf = CAEmitterCell()
        leaf.scale = 1
        leaf.velocityRange = CGFloat(80.0 * intensity)
        leaf.velocity = CGFloat(360 * intensity)
        leaf.emissionLongitude = direction == .top ? CGFloat(Double.pi) : CGFloat(-10)
        leaf.birthRate = 9 * intensity
        leaf.lifetime = 20
        leaf.contents = imageLeaf!.cgImage
        leaf.scaleRange = 0.5
        leaf.emissionRange = CGFloat(Double.pi / 10)
        return leaf
    }
    
    public func startLeaf(duration: TimeInterval = 0) {
        let y = direction == .top ? 0 : frame.size.height
        let x = frame.size.width / 2
        guard let _ = imageLeaf else {
            return
        }
        emitter.emitterPosition = CGPoint(x: x, y: y)
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterSize = CGSize(width: frame.size.width, height: 1)
        emitter.birthRate = 1
        emitter.emitterCells = [leafWithColor()]
        layer.addSublayer(emitter)
        active = true
        if duration != 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: {
                self.stopLeaf()
            })
        }
    }
    
    public func isActive() -> Bool {
        return self.active
    }
    
    public func stopLeaf() {
        active = false
        emitter.birthRate = 0
    }
    
    public func setImageForLeaf(imageLeaf: UIImage) {
        self.imageLeaf = imageLeaf
    }
}
