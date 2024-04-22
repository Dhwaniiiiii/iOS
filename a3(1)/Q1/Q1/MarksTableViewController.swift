//
//  MarksTableViewController.swift
//  Q1
//
//  Created by MSCICT2 on 4/8/24.
//

import UIKit
import CoreData

class MarksTableViewController: UITableViewController {

    var mkdata:[Marks] = []
    func display() {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        let res = NSFetchRequest<Marks>(entityName: "Marks")
        
        do{
            mkdata = try! con.fetch(res)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        display()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mkdata.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarksID", for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = "RDBMS \(mkdata[indexPath.row].rdbms),WD \(mkdata[indexPath.row].wd),ES \(mkdata[indexPath.row].es),Micro \(mkdata[indexPath.row].micro)"
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
            // Delete the row from the data source
            let appD = UIApplication.shared.delegate as! AppDelegate
            let con = appD.persistentContainer.viewContext
            con.delete(mkdata[indexPath.row])
            
            try! con.save()
            mkdata.remove(at: indexPath.row)
            
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
