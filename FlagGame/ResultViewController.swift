

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    
    @IBOutlet weak var previousTimeLabel: UILabel!
    
    var gameSeconds=0
    var correctAnswers=0
    var questionNumbers=0
    @IBAction func goToHistoryButton(_ sender: UIButton) {
        performSegue(withIdentifier: "resultToHistorySeque", sender: self)
    }
    @IBAction func replayButtonClick(_ sender: Any) {
        performSegue(withIdentifier: "resultToSelectSeque", sender: self)
    }
    @IBAction func quitButtonClick(_ sender: Any) {
        exit(0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let gamePercent=Float( correctAnswers) / Float( questionNumbers) * Float(100)
        percentLabel.text="Your score: \(String(Int( gamePercent)))%"
        let minutes:Int=gameSeconds/60
        let seconds=gameSeconds%60
        timeLable.text="In \(minutes)':\(seconds) seconds"
        if gamePercent<=60{
            statusImage.image=UIImage(named:"cry")
        }
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
