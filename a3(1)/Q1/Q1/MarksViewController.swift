//
//  MarksViewController.swift
//  Q1
//
//  Created by MSCICT2 on 4/8/24.
//

import UIKit
import CoreData

class MarksViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var selectstud:Int32 = 0
    var selectdata:Student?
    var studdata:[Student] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return studdata.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "name\(studdata[row].name!)"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectstud = studdata[row].rollno
        selectdata = studdata[row]
    }
    
    @IBOutlet weak var txtdiv: UITextField!
    
    @IBOutlet weak var txtrdbms: UITextField!
    
    @IBOutlet weak var txtmicro: UITextField!
    
    @IBOutlet weak var txtes: UITextField!
    
    @IBOutlet weak var txtwd: UITextField!
    
    @IBOutlet weak var txtroll: UIPickerView!
    
    func display() {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        let res = NSFetchRequest<Student>(entityName: "Student")
        
        do{
            studdata = try! con.fetch(res)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        display()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addmks(_ sender: Any) {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        let obj = Marks(context: con)
        
       
        obj.div = txtdiv.text!
        obj.rdbms = Int32(txtrdbms.text!)!
        obj.micro = Int32(txtmicro.text!)!
        obj.es = Int32(txtes.text!)!
        obj.wd = Int32(txtwd.text!)!
        obj.rollno = selectstud
        selectdata?.addToStudtomarks(obj)
        
        do{
            try! con.save()
            print("Added Succesfully")
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
