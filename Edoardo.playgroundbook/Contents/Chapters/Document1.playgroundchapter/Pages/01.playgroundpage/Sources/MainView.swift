import AVFoundation
import UIKit

open class MainView: UIView {
    var rainController: RainView?
    var audioName = ""
    var index = 0
    var audioBackground = AVAudioPlayer()
    var audioPages = AVAudioPlayer()
    var audioButton = AVAudioPlayer()
    var pages = [Page]()
    let heartView = LeafView(frame: UIScreen.main.bounds)
    let heartView2 = LeafView(frame: UIScreen.main.bounds)
    let leafView = LeafView(frame: UIScreen.main.bounds)
    
    let buttonNext: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "ButtonTriangleNext"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let buttonPrevious: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "ButtonTrianglePrevious"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        createItems()
        setupPage()
        presentView(index: 0)
        setupRainController()
        setupButtonNext()
        setupButtonPrevious()
        setupHeartView()
        setupLeafView()
    }
    
    func setupLeafView() {
        leafView.direction = .top
        leafView.intensity = 0.7
        leafView.setImageForLeaf(imageLeaf: UIImage(named:"leaf1")!)
        self.addSubview(leafView)
        leafView.isUserInteractionEnabled = false
    }
    
    func setupHeartView() {
        heartView.direction = .top
        heartView.intensity = 0.2
        heartView.setImageForLeaf(imageLeaf: UIImage(named:"Heart1")!)
        self.addSubview(heartView)
        heartView.isUserInteractionEnabled = false
    }
    
   @objc func buttonPreviousPressed(sender: UIButton!) {
        playButtonAudio(audioName: "Button_Press")
        previous()
    }
    
    @objc func buttonNextPressed(sender: UIButton!) {
        playButtonAudio(audioName: "Button_Press")
        forward()
    }
    
    func previous() {
        index -= 1
        presentView(index: index)
    }
    
    func forward() {
        index += 1
        presentView(index: index)
    }
    
    func presentView(index: Int) {
        UIView.transition(with: self, duration: 0.1, options: .transitionCrossDissolve, animations: {
            for page in self.pages {
                page.alpha = 0
            }
        }, completion: nil)
        pages[index].alpha = 1
        
        if index == 0 {
            buttonNext.animateBounce()
            buttonPrevious.alpha = 0
        }else{
            buttonPrevious.alpha = 1
            buttonNext.layer.removeAllAnimations()
        }
        if index == 15 {
            heartView.startLeaf()
            buttonNext.alpha = 0
        }else{
            heartView.stopLeaf()
            buttonNext.alpha = 1
        }

        if index == 8 {
            rainController?.startRain()
            leafView.stopLeaf()
        }else{
            rainController?.stopRain()
        }
        if index == 12 {
            leafView.startLeaf()
        }else{
            leafView.stopLeaf()
        }
        if index == 0 {
            playPagesAudio(audioName: "naturesounds")
        }
        if index == 4 {
            playPagesAudio(audioName: "Page3-4Sound")
        }else if index == 3 {
            playPagesAudio(audioName: "naturesounds")
        }
        if index == 6 {
            playAudio(audioName: "Page5Sound")
        }else if index == 5 {
            playAudio(audioName: "NoAudio")
        }
        if index == 7 {
            playAudio(audioName: "Page6Sound")
        }
        if index == 8 {
            playAudio(audioName: "RainSound")
        }
        if index == 9 {
            playPagesAudio(audioName: "10PageSound")
            playAudio(audioName: "NoAudio")
        }
        if index == 10 {
            playAudio(audioName: "gooseSound")
        }else if index == 9{
            playAudio(audioName: "NoAudio")
        }else if index == 11 {
            playAudio(audioName: "NoAudio")
        }
        if index == 13 {
            playPagesAudio(audioName: "13PageSound")
        }else if index == 12 {
            playPagesAudio(audioName: "12PageSound")
        }
    }
    
    func createItems() {
        let pageStart = Page(labelText: "", imageName: "StartPageImage", endLabelBool: false, startViewBool: true)
        pages.append(pageStart)
        let page0 = Page(labelText: "Please make sure that your audio is turned up for the best experience.", imageName: "0Page", endLabelBool: false, startViewBool: false)
        pages.append(page0)
        let page1 = Page(labelText: "Once upon a time in a big magical forest...", imageName: "1Page", endLabelBool: false, startViewBool: false)
        pages.append(page1)
        let page2 = Page(labelText: "There was Leo, a very little, yet not-so-happy, deer.", imageName: "2Page", endLabelBool: false, startViewBool: false)
        pages.append(page2)
        let page3 = Page(labelText: "He had friends who all had a passion for something, but he didn’t.", imageName: "3Page", endLabelBool: false, startViewBool: false)
        pages.append(page3)
        let page4 = Page(labelText: "So he decided to go to the forest to get some help from his friends.", imageName: "4Page", endLabelBool: false, startViewBool: false)
        pages.append(page4)
        let page5 = Page(labelText: "He braved dark nights...", imageName: "5Page", endLabelBool: false, startViewBool: false)
        pages.append(page5)
        let page6 = Page(labelText: "Dark forests...", imageName: "6Page", endLabelBool: false, startViewBool: false)
        pages.append(page6)
        let page7 = Page(labelText: "And the heavy rain...", imageName: "7Page", endLabelBool: false, startViewBool: false)
        pages.append(page7)
        let page8 = Page(labelText: "In his travels, he met a lot of animals with a passion for something.", imageName: "8Page", endLabelBool: false, startViewBool: false)
        pages.append(page8)
        let page9 = Page(labelText: "His first encounter was with a goose whose passion was to fly. Unfortunately, Leo didn’t have any wings with which to fly.", imageName: "9Page", endLabelBool: false, startViewBool: false)
        pages.append(page9)
        let page10 = Page(labelText:"He then met a mom who looked after her son lovingly, but Leo didn't have any son." , imageName: "10Page", endLabelBool: false, startViewBool: false)
        pages.append(page10)
        let page11 = Page(labelText: "He then saw two rabbits; their passion was to jump on the grass, but Leo didn't like it.", imageName: "11Page", endLabelBool: false, startViewBool: false)
        pages.append(page11)
        let page12  = Page(labelText: "After he had explored every place in the world, he finally found his passion.", imageName: "12Page", endLabelBool: false, startViewBool: false)
        pages.append(page12)
        let page13 = Page(labelText: "His passion was going around and exploring the world. It made him so happy!", imageName: "13Page", endLabelBool: false, startViewBool: false)
        pages.append(page13)
        let page14 = Page(labelText: "End", imageName: "13Page", endLabelBool: true, startViewBool: false)
        pages.append(page14)
        let page15 = Page(labelText: "", imageName: "", endLabelBool: false, startViewBool: false)
        pages.append(page15)
    }
    
    func setupPage() {
        for page in pages {
            self.addSubview(page)
            page.alpha = 0
            page.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            page.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            page.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            page.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        }
    }
    
    func setupButtonPrevious() {
        self.addSubview(buttonPrevious)
        buttonPrevious.addTarget(self, action: #selector(buttonPreviousPressed(sender:)), for: .touchUpInside)
        buttonPrevious.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        buttonPrevious.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        buttonPrevious.heightAnchor.constraint(equalToConstant: 84).isActive = true
        buttonPrevious.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupButtonNext() {
        self.addSubview(buttonNext)
        buttonNext.addTarget(self, action: #selector(buttonNextPressed(sender:)), for: .touchUpInside)
        buttonNext.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        buttonNext.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        buttonNext.heightAnchor.constraint(equalToConstant: 84).isActive = true
        buttonNext.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func playAudio(audioName: String) {
        do {
            audioBackground = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: audioName, ofType: "mp3")!))
            audioBackground.play()
        }catch{
            print(error)
        }
    }
    
    func playButtonAudio(audioName: String) {
        do {
            audioButton = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: audioName, ofType: "mp3")!))
            audioButton.play()
        }catch{
            print(error)
        }
    }
    
    func playPagesAudio(audioName: String) {
        do {
            audioPages = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: audioName, ofType: "mp3")!))
            audioPages.numberOfLoops = -1
            audioPages.play()
        }catch{
            print(error)
        }
    }
    
    func stopPagesAudio(audioName: String) {
        do {
            audioPages = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: audioName, ofType: "mp3")!))
            audioPages.stop()
        }catch{
            print(error)
        }
    }
    
    func setupRainController() {
        rainController = RainView(view: self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

