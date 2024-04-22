//
//  MarksViewController.swift
//  Q-1
//
//  Created by MSCICT2 on 08/04/24.
//

import UIKit
import CoreData
class MarksViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stud.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stud[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        id = stud[row].rollno
    }
    
    var stud : [Stud_Mstr] = []
    var id:Int32  =  0
    func Disp() {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        
        let fr = NSFetchRequest<Stud_Mstr>(entityName: "Stud_Mstr")
        
        do{
            stud = try! con.fetch(fr)
        }
    }

    
    
    
    @IBOutlet weak var txtEd: UITextField!
    @IBOutlet weak var txtEs: UITextField!
    @IBOutlet weak var txtMicro: UITextField!
    @IBOutlet weak var txtrdbms: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Disp()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func bnt_insertMartks(_ sender: Any) {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        
        let obj = Stud_marks(context: con)
        obj.setValue(Int(txtrdbms.text!), forKey: "rdbms")
        obj.setValue(Int(txtMicro.text!), forKey: "micro")
        
        obj.setValue(Int(txtEs.text!), forKey: "es")
        obj.setValue(Int(txtEd.text!), forKey: "wd")
        
        obj.rollno = id
        
        
        
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
