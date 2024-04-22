//
//  SubmmissionViewController.swift
//  Q3
//
//  Created by MSCICT2 on 4/9/24.
//

import UIKit
import CoreData

class SubmmissionViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var selectassg:Int32 = 0
    var selectdata:Assignment?
    var assgdata:[Assignment] = []
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return assgdata.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "subject\(assgdata[row].subject!)"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectassg = assgdata[row].assgno
        selectdata = assgdata[row]
    }
    
    @IBOutlet weak var txtno: UIPickerView!
    
    @IBOutlet weak var txtstatus: UITextField!
    
    @IBOutlet weak var txtdate: UITextField!
    
    
    @IBOutlet weak var txtgrade: UITextField!
    
    func display() {
            let appD = UIApplication.shared.delegate as! AppDelegate
            let con = appD.persistentContainer.viewContext
            let res = NSFetchRequest<Assignment>(entityName: "Assignment")
            
            do{
                assgdata = try! con.fetch(res)
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
        let obj = Submission(context: con)
        
        obj.grade = txtgrade.text!
        obj.substatus = txtstatus.text!
        obj.subdate = txtdate.text!
        obj.assgno = selectassg
        selectdata?.addToAssgtosub(obj)
               
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
