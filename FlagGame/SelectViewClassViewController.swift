
import UIKit

class SelectViewClassViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    var continents=[String]()
    let numbers=[5,10,15]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView==continentPicker {
            return continents.count
        }else{
            return numbers.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView==continentPicker {
            return continents[row]
        }else{
            return String(numbers[row])
        }    }
    

    @IBOutlet weak var continentPicker: UIPickerView!
    @IBOutlet weak var numberPicker: UIPickerView!
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true
            , completion: nil)
    }
    @IBAction func startButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "selectToGameSeque", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setContinents()
        continentPicker.delegate=self
        continentPicker.dataSource=self
        numberPicker.delegate=self
        numberPicker.dataSource=self
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="selectToGameSeque" {
            let dist=segue.destination as! GameViewController
            dist.numberOfQuestions=numbers[ numberPicker.selectedRow(inComponent: 0)]
            dist.continent=continents[continentPicker.selectedRow(inComponent: 0)].replacingOccurrences(of: " ", with: "_")
        }
    }
    func setContinents(){
        let fileManager = FileManager.default
        let bundleURL = Bundle.main.bundleURL
        let assetURL = bundleURL.appendingPathComponent("flags")
        let contents = try! fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
        
        for item in contents
        {
            continents.append(item.lastPathComponent.replacingOccurrences(of: "_", with: " "))
            
        }
        continents.append("World")
    }
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */

}
