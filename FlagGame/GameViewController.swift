
import UIKit

class GameViewController: UIViewController {
    var numberOfQuestions:Int = 0
    var playNumber=0
    var continent:String=""
    var countries = [FlagModel]()
    @IBOutlet weak var mainImage: UIImageView!
    @IBAction func buttonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "gameToResultSeque", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fillCountries()
        if playNumber>numberOfQuestions{
            //show result
            return
        }
        countries.shuffle()
        let data:NSData? = NSData(contentsOf : countries[0].url)
        let image = UIImage(data : data! as Data)
        mainImage.image=image
        
        for _ in 0..<numberOfQuestions {
            //todo find random country
            //find 3 other random country
            //show first country as image and show name in button
            //show 3 other country name in buttons
        }
    }
    func fillCountries(){
        countries.removeAll()
        if continent=="World" {
            let fileManager = FileManager.default
            let bundleURL = Bundle.main.bundleURL
            let assetURL = bundleURL.appendingPathComponent("flags")
            let contents = try! fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
            
            for item in contents
            {
                fillFlagModel(selectedContinent: item.lastPathComponent)
            }
        }
        else{
            fillFlagModel(selectedContinent: continent)
        }
       
    }
    func fillFlagModel(selectedContinent:String        )
    {
        let fileManager = FileManager.default
        let bundleURL = Bundle.main.bundleURL
        let assetURL = bundleURL.appendingPathComponent("flags/\(selectedContinent)")
        let contents = try! fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
        
        for item in contents
        {
            let tempFlagModel = FlagModel(imgName: item.lastPathComponent,cntName: selectedContinent,imgUrl: item.absoluteURL)
            countries.append(tempFlagModel)
        }
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
