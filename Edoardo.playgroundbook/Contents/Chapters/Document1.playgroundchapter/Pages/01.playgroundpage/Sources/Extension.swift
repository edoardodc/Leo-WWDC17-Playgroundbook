import UIKit

extension UIView {
    func animateBounce() {
        self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        UIView.animate(withDuration: 3.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 3.0,
                       options: [.repeat, .allowUserInteraction],
                       animations: { [weak self] in self!.transform = .identity
            }, completion: nil)
    }
}
