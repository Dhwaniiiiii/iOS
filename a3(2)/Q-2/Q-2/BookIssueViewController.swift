//
//  BookIssueViewController.swift
//  Q-2
//
//  Created by Harsh on 10/04/24.
//

import UIKit
import CoreData
class BookIssueViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var book : [Book] = []
    
    
    func DispBook()  {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        
        let fr  = NSFetchRequest<Book>(entityName: "Book")
        
        do{
            book = try! con.fetch(fr)
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return book.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return book[row].bookname
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bo = book[row]
    }
    
    var id : Int32 = 0

    var bo : Book?
    
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtstatus: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        DispBook()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn_addBookIssue(_ sender: Any) {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        
        let obj = BookIssueReturn(context: con)
        
        obj.setValue(bo?.bookid, forKey: "bookid")
        obj.setValue(txtstatus.text!, forKey: "status")
        obj.setValue(txtDate.text!, forKey: "irdate")
        
        bo?.addToToBookIssueReturn(obj)
        
        do{
            try! con.save()
            print("Book Return inserted Successfully...")
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
