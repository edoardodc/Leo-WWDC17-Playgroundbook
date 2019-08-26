import UIKit

open class BackgroundView: UIView {

    let backgroundView: UIView = {
        let background = UIImageView(image: UIImage(named:"GroundImage"))
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackgroundView()
    }
    
    fileprivate func setupBackgroundView() {
        self.addSubview(backgroundView)
        self.backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.backgroundView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.backgroundView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
