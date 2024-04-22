//
//  StudViewController.swift
//  Q-1
//
//  Created by MSCICT2 on 08/04/24.
//

import UIKit
import CoreData
class StudViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    var gender:[String] = ["Male","Female"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = gender[row]
    }

    @IBOutlet weak var txtDob: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtArea: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDiv: UITextField!
    @IBOutlet weak var txtSem: UITextField!
    @IBOutlet weak var txtRoll: UITextField!
    
    var selectedRow:String  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_InsertStud(_ sender: Any) {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        
        let obj = Stud_Mstr(context: con)
        obj.setValue(Int(txtRoll.text!), forKey: "rollno")
        obj.setValue(Int(txtSem.text!), forKey: "sem")
        obj.setValue(txtDiv.text!, forKey: "div")
        obj.setValue(txtName.text!, forKey: "name")
        obj.setValue(txtArea.text!, forKey: "area")
        obj.setValue(txtCity.text!, forKey: "city")
        obj.setValue(Int(txtDob.text!), forKey: "dob")
        obj.setValue(selectedRow, forKey: "gender")
        
        
        do{
            try! con.save()
            print("Student inserted...")
            
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
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
