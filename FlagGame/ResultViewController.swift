//
//  ResultViewController.swift
//  FlagGame
//
//  Created by Mehdi on 2019-03-15.
//  Copyright © 2019 Mehdi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

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

        // Do any additional setup after loading the view.
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
