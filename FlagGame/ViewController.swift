
import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var welcomeView: UIView!
    @IBAction func playBtn(_ sender: Any) {

       
        performSegue(withIdentifier: "playseque", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}

