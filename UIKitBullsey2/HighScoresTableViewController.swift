//
//  HighScoresTableViewController.swift
//  UIKitBullsey2
//
//  Created by Giorgi Gogichaishvili on 10/27/21.
//

import UIKit

class HighScoresTableViewController: UITableViewController, EditHighScoreViewControllerDelegate {
    func editHighScoreViewControllerDidCancel(_ controller: EditHighScoreViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func editHighScoreViewController(_ controller: EditHighScoreViewController, didFinishEditing item: HighScoreItem) {
        if let index = items.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            let indexPaths = [indexPath]
            tableView.reloadRows(at: indexPaths, with: .automatic)
        }
        PersistencyHelper.saveHighScores(items)
        navigationController?.popViewController(animated: true)
    }
    
    //change them with that bellow
//    let row0item = HighScoreItem()
//    let row1item = HighScoreItem()
//    let row2item = HighScoreItem()
//    let row3item = HighScoreItem()
//    let row4item = HighScoreItem()
    var items = [HighScoreItem]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        row0item.name = "The reader of this book"
//        row0item.score = 50000
//        row1item.name = "Manda"
//        row1item.score = 10000
//        row2item.name = "Joey"
//        row2item.score = 5000
//        row3item.name = "Adam"
//        row3item.score = 1000
//        row4item.name = "Eli"
//        row4item.score = 500
        // instead of them change them with bellow
//        let item1 = HighScoreItem()
//        item1.name = "The reader of this book"
//        item1.score = 5000
//        items.append(item1)
//
//        let item2 = HighScoreItem()
//        item2.name = "Manda"
//        item2.score = 1000
//        items.append(item2)
//
//        let item3 = HighScoreItem()
//        item3.name = "Joey"
//        item3.score = 5000
//        items.append(item3)
//
//        let item4 = HighScoreItem()
//        item4.name = "Adam"
//        item4.score = 1000
//        items.append(item4)
//
//        let item5 = HighScoreItem()
//        item5.name = "Eli"
//        item5.score = 500
//        items.append(item5)
        items = PersistencyHelper.loadHighScores()
        if (items.count == 0) {
            resetHighScores()
        }
       
    }
    // MARK: - Actions
    @IBAction func resetHighScores() {
        items = [HighScoreItem]()
        let item1 = HighScoreItem()
        item1.name = "The reader of this book"
        item1.score = 5000
        items.append(item1)
        
        let item2 = HighScoreItem()
        item2.name = "Manda"
        item2.score = 1000
        items.append(item2)
        
        let item3 = HighScoreItem()
        item3.name = "Joey"
        item3.score = 5000
        items.append(item3)
        
        let item4 = HighScoreItem()
        item4.name = "Adam"
        item4.score = 1000
        items.append(item4)
        
        let item5 = HighScoreItem()
        item5.name = "Eli"
        item5.score = 500
        items.append(item5)
        tableView.reloadData()
        PersistencyHelper.saveHighScores(items)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! EditHighScoreViewController
        controller.delegate = self
        if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
            controller.highScoreItem = items[indexPath.row]
        }
    }
    

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreItem", for: indexPath)
        let item = items[indexPath.row]
        let nameLabel = cell.viewWithTag(1000) as! UILabel
        let scoreLabel = cell.viewWithTag(2000) as! UILabel
        nameLabel.text = item.name
        scoreLabel.text = String(item.score)
        

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        PersistencyHelper.saveHighScores(items)
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK:- Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
