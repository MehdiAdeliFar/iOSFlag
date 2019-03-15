//
//  GameViewController.swift
//  FlagGame
//
//  Created by Mehdi on 2019-03-15.
//  Copyright © 2019 Mehdi. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBAction func buttonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "gameToResultSeque", sender: self)
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
