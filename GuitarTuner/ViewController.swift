
import UIKit
/** Play Sound **/
import AudioToolbox

class ViewController: UIViewController {
    
    let background = UIImageView()

    @IBOutlet weak var firstString: UIButton!
    @IBOutlet weak var secondString: UIButton!
    @IBOutlet weak var thirdString: UIButton!
    @IBOutlet weak var fourthString: UIButton!
    @IBOutlet weak var fifthString: UIButton!
    @IBOutlet weak var sixthString: UIButton!
    
    //display note code
    @IBOutlet weak var stringCode: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        addRotation()
        stringCode.text = addNoteByTag(0)
    }
    
    func addBackground() {
        view.addSubview(background)
        // needed to use autoLayout
        background.translatesAutoresizingMaskIntoConstraints = false
        //top-bottom
        background.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //leading-trailing
        background.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //add the image
        background.image = UIImage.init(named: "background")
        //sending the image to the background
        view.sendSubviewToBack(background)
    }
    
    @IBAction func playSound(_ sender: Any) {
        let button = (sender as! UIButton)
        let tag = button.tag
        playSound(tag)
        stringCode.text = addNoteByTag(tag)
    }
    
    func playSound(_ tag:Int) {
        // If the sound exists? then play the or the wav
        if let soundURL = Bundle.main.url(forResource: "\(tag)", withExtension: "wav") {
            // Identificación
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound)
            print("did play: \(tag).wav")
        }
    }
    
    
    func addRotation() {
        firstString.transform = firstString.transform.rotated(by: CGFloat(-0.030))
        secondString.transform = secondString.transform.rotated(by: CGFloat(-0.023))
        thirdString.transform = thirdString.transform.rotated(by: CGFloat(-0.015))
        fourthString.transform = fourthString.transform.rotated(by: CGFloat(-0.010))
        fifthString.transform = fifthString.transform.rotated(by: CGFloat(-0.010))
    }
    
    func addNoteByTag(_ tag:Int) -> String {
        switch tag {
        case 1: return "E"
        case 2: return "B"
        case 3: return "G"
        case 4: return "D"
        case 5: return "A"
        case 6: return "E"
        default: return " "
        }
    }
}
