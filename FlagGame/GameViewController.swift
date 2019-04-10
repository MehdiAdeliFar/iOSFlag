
import UIKit

class GameViewController: UIViewController {
    var numberOfQuestions:Int = 0
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBAction func btnClicked(_ sender: UIButton) {
        print(sender.titleLabel?.text)
        if playNumber>numberOfQuestions{
            //show result
            performSegue(withIdentifier: "gameToResultSeque", sender: self)
            return
        }
        checkAnswer(selectedName: sender.title(for: .normal))
        showFlag()
        playNumber=playNumber+1
    }
    
    var playNumber=0
    var continent:String=""
    var countries = [FlagModel]()
    @IBOutlet weak var mainImage: UIImageView!
    @IBAction func buttonClicked(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fillCountries()
       
        showFlag()
        
//        for _ in 0..<numberOfQuestions {
//            //todo find random country
//            //find 3 other random country
//            //show first country as image and show name in button
//            //show 3 other country name in buttons
//        }
    }
    func checkAnswer(selectedName:String!) {
        
    }
    func showFlag()  {
        countries.shuffle()
        let data:NSData? = NSData(contentsOf : countries[0].url)
        let image = UIImage(data : data! as Data)
        mainImage.image=image
        var showingCountries=[countries[0],countries[1],countries[2],countries[3]]
        showingCountries.shuffle()
        btn1.setTitle(getOnlyCountryName(c: showingCountries[0]) , for: .normal)
        print(showingCountries[0].imageName)
       btn2.setTitle(getOnlyCountryName(c: showingCountries[1]), for: .normal)
        print(showingCountries[1].imageName)
        btn3.setTitle(getOnlyCountryName(c: showingCountries[2]), for: .normal)
        print(showingCountries[2].imageName)
        btn4.setTitle(getOnlyCountryName(c: showingCountries[3]), for: .normal)
        print(showingCountries[3].imageName)
    }
    func getOnlyCountryName(c:FlagModel) -> String {
        let name=c.imageName.replacingOccurrences(of: "\(c.continentName)-", with: "")
        return name.replacingOccurrences(of: ".png", with: "")
    
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
