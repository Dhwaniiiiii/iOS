//
//  MarksTableViewController.swift
//  ps3Q1
//
//  Created by MSCICT2 on 08/04/24.
//

import UIKit
import CoreData

class MarksTableViewController: UITableViewController {

    var markData:[Stud_marks] = []
    func display(){
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        
        let res = NSFetchRequest<Stud_marks>(entityName: "Stud_marks")
        do{
            markData = try! con.fetch(res)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        display()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return markData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "marksidenty", for: indexPath)

        cell.textLabel?.text = "Name \( markData[indexPath.row].toMaster?.name!)  RDMS  \(markData[indexPath.row].rdbms) ES\(markData[indexPath.row].es)  Mirco\(markData[indexPath.row].micro)  WD\(markData[indexPath.row].wd)"
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
        if editingStyle == .delete {
            let appD = UIApplication.shared.delegate as! AppDelegate
            let con = appD.persistentContainer.viewContext
        
            con.delete(markData[indexPath.row])
            try! con.save()
            
            markData.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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

}
