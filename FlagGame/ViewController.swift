
import UIKit

class ViewController: UIViewController {


   /* @IBOutlet weak var testText: UITextField!
    @IBOutlet weak var resutlLbl: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBAction func sayName() {
        let name=testText.text!
        let btnText=btn.currentTitle!
        resutlLbl.text=" \(name) btn \(btnText)"
    }*/
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var welcomeView: UIView!
    @IBAction func playBtn(_ sender: Any) {
//        self.welcomeView.isHidden=true
//        self.gameView.isHidden=false
        let fileManager = FileManager.default
        let bundleURL = Bundle.main.bundleURL
        let assetURL = bundleURL.appendingPathComponent("Images.bundle")
        let contents = try! fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
        
        for item in contents
        {
            print(item.lastPathComponent)
        }
        performSegue(withIdentifier: "playseque", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}

