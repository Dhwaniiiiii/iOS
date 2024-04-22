//
//  BookViewController.swift
//  Q2
//
//  Created by MSCICT2 on 4/9/24.
//

import UIKit
import CoreData

class BookViewController: UIViewController {

    @IBOutlet weak var txtbid: UITextField!
    
    @IBOutlet weak var txtname: UITextField!
    
    @IBOutlet weak var txtauthor: UITextField!
    
    @IBOutlet weak var txtprice: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func addbtn(_ sender: Any) {
        
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        let obj = Book(context: con)
        
        obj.bookId = Int32(txtbid.text!)!
        obj.bookname = txtname.text!
        obj.author = txtauthor.text!
        obj.price = txtprice.text!
        
        do{
            try! con.save()
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
            print("Successfully!!")
            print(path)
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
