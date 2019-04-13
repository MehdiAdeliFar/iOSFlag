
import UIKit

class GameViewController: UIViewController {
    
    var numberOfQuestions:Int = 0
    var correctAnswersCount=0
    var timeCounter=0
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    var playNumber=0
    var continent:String=""
    var countries = [FlagModel]()
    var timer=Timer()
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        showFlag()
        nextBtn.isHidden=true
    }
    
    
    @IBAction func btnClicked(_ sender: UIButton) {
        
        checkAnswer(selectedName: sender.title(for: .normal))
        
        if playNumber>=numberOfQuestions{
           timer.invalidate()
            
            //show result
            performSegue(withIdentifier: "gameToResultSeque", sender: self)
            return
        }
        playNumber=playNumber+1
        nextBtn.isHidden=false
        
    }
    
    
    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeCounter=0
        fillCountries()
        playNumber=1
        showFlag()
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(addTimerCounter), userInfo: nil, repeats: true)
        
   
    }
    @objc func addTimerCounter()  {
        timeCounter=timeCounter+1
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameToResultSeque"{
            let dest=segue.destination as! ResultViewController
            dest.gameSeconds=timeCounter
            dest.correctAnswers=correctAnswersCount
            dest.questionNumbers=self.numberOfQuestions
        }
    }
    func checkAnswer(selectedName:String!) {
        print("checking answer\(String(describing: selectedName))")
        let answerFlag=getOnlyCountryName(c: countries[0])
        print(answerFlag)
        btn1.backgroundColor = btn1.title(for: .normal) == answerFlag ? UIColor.green :  UIColor.red
        btn2.backgroundColor = btn2.title(for: .normal) == answerFlag ? UIColor.green :  UIColor.red
        btn3.backgroundColor = btn3.title(for: .normal) == answerFlag ? UIColor.green :  UIColor.red
        btn4.backgroundColor = btn4.title(for: .normal) == answerFlag ? UIColor.green :  UIColor.red
        
        
        
        if selectedName == answerFlag {
            //correct answer
            correctAnswersCount=correctAnswersCount+1
        }
        else{
            //wrong answer
        }
        
        
    }
    //set image from url cited: https://stackoverflow.com/questions/10972555/ios-load-an-image-from-url/27822875
    func showFlag()  {
       
        countries.shuffle()
        let data:NSData? = NSData(contentsOf : countries[0].url)
        let image = UIImage(data : data! as Data)
        mainImage.image=image
        var showingCountries=[countries[0],countries[1],countries[2],countries[3]]
        showingCountries.shuffle()
        btn1.setTitle(getOnlyCountryName(c: showingCountries[0]) , for: .normal)
        
        btn2.setTitle(getOnlyCountryName(c: showingCountries[1]), for: .normal)
        
        btn3.setTitle(getOnlyCountryName(c: showingCountries[2]), for: .normal)
        
        btn4.setTitle(getOnlyCountryName(c: showingCountries[3]), for: .normal)
        btn1.backgroundColor=UIColor.init(red:161/255,green:197/255,blue:255/255,alpha:1)
        btn2.backgroundColor=UIColor.init(red:161/255,green:197/255,blue:255/255,alpha:1)
       btn3.backgroundColor=UIColor.init(red:161/255,green:197/255,blue:255/255,alpha:1)
        btn4.backgroundColor = UIColor.init(red:161/255,green:197/255,blue:255/255,alpha:1)
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
