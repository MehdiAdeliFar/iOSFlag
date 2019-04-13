

import UIKit
import SQLite3
class ResultViewController: UIViewController {
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var previousTimeLabel: UILabel!
    
    @IBOutlet weak var congMsgLabel: UILabel!
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
        var minutes:Int=gameSeconds/60
        var seconds=gameSeconds%60
        timeLable.text="In \(minutes)':\(seconds) seconds"
        
        //change image in uiimage cited: https://stackoverflow.com/questions/26191228/how-to-change-uiimages-image-on-button-click-in-swift
        
        if gamePercent<=60{
            statusImage.image=UIImage(named:"cry")
            congMsgLabel.text="Maybe next time!"
        }
        let db=DatabaseAction()
        db.insertScoreToDB(data: Score(_id: 0, _time: gameSeconds, _q: questionNumbers, _c: correctAnswers))
        correctLabel.text="Correct answers:\(correctAnswers) of \(questionNumbers)"
        let lastScores=db.getScores()
        if lastScores.count>1 {
            minutes=lastScores[1].time / 60
            seconds=lastScores[1].time % 60
            previousTimeLabel.text="Previoust time: \(minutes)':\(seconds)"
        }else{
            previousTimeLabel.text="this was first game"
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
