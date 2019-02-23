
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
        self.welcomeView.isHidden=true
        self.gameView.isHidden=false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}

