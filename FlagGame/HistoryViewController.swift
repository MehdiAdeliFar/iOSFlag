//
//  HistoryViewController.swift
//  FlagGame
//
//  Created by Mehdi on 2019-03-15.
//  Copyright © 2019 Mehdi. All rights reserved.
//

import UIKit

<<<<<<< HEAD
class HistoryViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    let tableData=["time:1:30 score 95%","time:2:30 score 95%","time:3:30 score 95%"]
    // table view from https://www.appcoda.com/ios-programming-tutorial-create-a-simple-table-view-app/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    // fill cell value picked from https://www.ioscreator.com/tutorials/tableview-tutorial-in-ios8-with-swift
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier:"cell")
        cell.textLabel?.text=tableData[indexPath.row]
        
        return cell
    }
    
    

    @IBOutlet weak var historyTable: UITableView!
=======
class HistoryViewController: UIViewController {
    

>>>>>>> 42e7fe81ff0fcf08ed4a8352adf7b45b48847292
    @IBAction func historyBackButton(_ sender: Any) {
        dismiss(animated: true
            , completion: nil)
    }
    @IBAction func playAgainClicked(_ sender: Any) {
        performSegue(withIdentifier: "historyToSelectSeque", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        historyTable.delegate=self
        historyTable.dataSource=self
=======
>>>>>>> 42e7fe81ff0fcf08ed4a8352adf7b45b48847292
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
