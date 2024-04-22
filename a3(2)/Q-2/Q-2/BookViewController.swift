//
//  BookViewController.swift
//  Q-2
//
//  Created by Harsh on 10/04/24.
//

import UIKit
import CoreData
class BookViewController: UIViewController {

    @IBOutlet weak var txtprice: UITextField!
    @IBOutlet weak var txtauthor: UITextField!
    @IBOutlet weak var txtbname: UITextField!
    @IBOutlet weak var txtbid: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn_insert_book(_ sender: Any) {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        
        let obj = Book(context: con)
        obj.setValue(Int(txtbid.text!), forKey: "bookid")
        obj.setValue(txtbname.text!, forKey: "bookname")
        obj.setValue(txtauthor.text!, forKey: "author")
        obj.setValue(Int(txtprice.text!), forKey: "price")
        
        do{
            try! con.save()
            print("Book Inserted...")
            
            let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            print(dirPath[0])
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
