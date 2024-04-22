//
//  IssueViewController.swift
//  Q2
//
//  Created by MSCICT2 on 4/9/24.
//

import UIKit
import CoreData

class IssueViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var selectbook:Int32 = 0
    var selectdata:Book?
    var bookdata:[Book]=[]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookdata.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "name\(bookdata[row].bookname!)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectbook = bookdata[row].bookId
        selectdata = bookdata[row]
    }

    
    @IBOutlet weak var txtbookId: UIPickerView!
    
    @IBOutlet weak var txtstatus: UITextField!
    
    @IBOutlet weak var txtdate: UITextField!
    
    func display() {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        let res = NSFetchRequest<Book>(entityName: "Book")
        
        do{
            bookdata=try!con.fetch(res)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        display()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addbtn(_ sender: Any) {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        let obj = Return(context: con)

        obj.status = txtstatus.text!
        obj.irdate = txtdate.text!
        obj.bookid = selectbook
        selectdata?.addToBooktoreturn(obj)
        
        do{
            try!con.save()
            
            let alert = UIAlertController(title: "Book Alert ", message: "Insertted Succesfully!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true,completion: nil)
            
            print("Added Succesfully!!")
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
