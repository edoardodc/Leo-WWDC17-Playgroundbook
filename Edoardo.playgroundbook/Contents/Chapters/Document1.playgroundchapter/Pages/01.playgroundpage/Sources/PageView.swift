import UIKit

open class Page: BackgroundView {
    
    let mainLabel: UILabel = {
        let fontURL = Bundle.main.url(forResource: "Brandon_reg", withExtension: "otf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
        var font = UIFont(name: "Brandon Grotesque", size: 27)
        
        var attrs = [NSAttributedStringKey: Any]()
        attrs[NSAttributedStringKey.font] = font
        attrs[NSAttributedStringKey.foregroundColor] = UIColor.white
        attrs[NSAttributedStringKey.baselineOffset] = 0.0
        
        let label = UILabel()
        label.textColor = .white
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 175
        view.clipsToBounds = true
        return view
    }()
    let endLabel: UILabel = {
        let fontURL = Bundle.main.url(forResource: "Brandon_reg", withExtension: "otf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
        var font = UIFont(name: "Brandon Grotesque", size: 55)
        var attrs = [NSAttributedStringKey: Any]()
        attrs[NSAttributedStringKey.font] = font
        attrs[NSAttributedStringKey.foregroundColor] = UIColor.white
        attrs[NSAttributedStringKey.baselineOffset] = 0.0
        
        let label = UILabel()
        label.textColor = .white
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    let detailLabel: UILabel = {
        let fontURL = Bundle.main.url(forResource: "Brandon_reg", withExtension: "otf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
        var font = UIFont(name: "Brandon Grotesque", size: 25)
        var attrs = [NSAttributedStringKey: Any]()
        attrs[NSAttributedStringKey.font] = font
        attrs[NSAttributedStringKey.foregroundColor] = UIColor.white
        attrs[NSAttributedStringKey.baselineOffset] = 0.0
        let label = UILabel()
        label.textColor = .white
        label.font = font
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    init(labelText: String, imageName: String, endLabelBool: Bool, startViewBool: Bool) {
        super.init(frame: UIScreen.main.bounds)
        self.setupImageView()
        self.setupLabel()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.image = UIImage(named: imageName)
        self.mainLabel.text = labelText
        if endLabelBool {
            self.imageView.alpha = 0
            self.mainLabel.alpha = 0
            self.setupLabelEnd(label: "The End")
            self.setupEndLabelDetail(label: "I hope you loved the story, these custom sounds and graphics.")
        }
        if startViewBool {
            self.setupImageViewStart()
            self.setupLabelStart(label: "Hello there!")
            self.setupLabelDetail(label: "This story reflects my life and my quest to find a passion.")
            self.imageView.layer.cornerRadius = 0
        }
    }
    
    func setupLabelStart(label: String) {
        self.addSubview(endLabel)
        self.endLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.endLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40).isActive = true
        self.endLabel.text = label
    }
    
    fileprivate func setupLabel() {
        self.addSubview(mainLabel)
        self.mainLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        self.mainLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        self.mainLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    fileprivate func setupImageView() {
        self.addSubview(imageView)
        self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    fileprivate func setupImageViewStart() {
        self.addSubview(imageView)
        self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -140).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupLabelEnd(label: String) {
        self.addSubview(endLabel)
        self.endLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.endLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50).isActive = true
        self.endLabel.text = label
    }
    
    func setupLabelDetail(label:String) {
        self.addSubview(detailLabel)
        self.detailLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.detailLabel.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor, constant: 280).isActive = true
        self.detailLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        self.detailLabel.text = label
    }
    
    func setupEndLabelDetail(label:String) {
        self.addSubview(detailLabel)
        self.detailLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.detailLabel.topAnchor.constraint(equalTo: self.mainLabel.bottomAnchor, constant: 180).isActive = true
        self.detailLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        self.detailLabel.text = label
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
