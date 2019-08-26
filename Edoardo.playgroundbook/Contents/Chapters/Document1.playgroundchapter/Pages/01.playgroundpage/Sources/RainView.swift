import UIKit

class RainView {
    
    var view: UIView!
    var isAnimating = false

    fileprivate var drops: [UIView] = []
    fileprivate var dropColor = UIColor(red:103/255, green:135/255, blue:145/255, alpha:1.0)
    fileprivate var gravityBehavior = UIGravityBehavior()
    fileprivate var startY: CGFloat!
    fileprivate var startX: CGFloat!
    fileprivate var animator: UIDynamicAnimator!
    fileprivate var distanceBetweenEachDrop: CGFloat!
    fileprivate var distanceBetweenSameRow: CGFloat!
    fileprivate var timer1 = Timer()
    fileprivate var timer2 = Timer()
    
    init(view: UIView) {
        self.view = view
        let width = self.view.frame.width
        startY = -60
        startX = 20
        distanceBetweenEachDrop = width * 0.048
        gravityBehavior.gravityDirection.dy = 2
        distanceBetweenSameRow = distanceBetweenEachDrop * 2
        animator = UIDynamicAnimator(referenceView: self.view)
        animator.addBehavior(gravityBehavior)
    }
    
    fileprivate func startSecond() {
        timer2 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(spawnFirst), userInfo: nil, repeats: true)
    }
    
    fileprivate func addGravity(_ array: [UIView]) {
        for drop in array {
            gravityBehavior.addItem(drop)
        }
    }
    
    func startRain() {
        isAnimating = true
        timer1 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(spawnFirst), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(spawnFirst), userInfo: nil, repeats: false)
    }
    
    func stopRain() {
        isAnimating = false
        drops.removeAll()
        timer1.invalidate()
        timer2.invalidate()
    }
    
    @objc fileprivate func spawnFirst() {
        var thisArray: [UIView] = []
        let numberOfDrops = 10
        for _ in 0 ..< numberOfDrops {
            let newX = CGFloat(10 + Int(arc4random_uniform(UInt32(1000))))
             let newY = CGFloat(-200 + Int(arc4random_uniform(UInt32(150))))
            let drop = UIView()
            drop.frame = CGRect(x: newX, y: newY, width: 1.0, height: 50.0)
            drop.layer.borderWidth = 0.0
            drop.backgroundColor = dropColor
            self.drops.append(drop)
            self.view.addSubview(drop)
            thisArray.append(drop)
        }
        addGravity(thisArray)
    }
    
}
