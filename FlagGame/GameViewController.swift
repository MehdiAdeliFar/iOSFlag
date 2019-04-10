
import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBAction func buttonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "gameToResultSeque", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func changeImage(){
        let fileManager = FileManager.default
        let bundleURL = Bundle.main.bundleURL
        let assetURL = bundleURL.appendingPathComponent("flags/Asia")
        let contents = try! fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
        
        for item in contents
        {
            print(item.lastPathComponent)
        }
        let data:NSData? = NSData(contentsOf : contents[contents.count-1].absoluteURL)
        let image = UIImage(data : data! as Data)
        mainImage.image=image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
