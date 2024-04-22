//
//  MarksViewController.swift
//  ps3Q1
//
//  Created by MSCICT2 on 08/04/24.
//

import UIKit
import CoreData
class MarksViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
   
    
    var selectedStudent:Int32 = 0
    var selectedStud_master : Stud_master?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return studData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Name:\(studData[row].name!)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedStudent = studData[row].rollno
        
        selectedStud_master = studData[row]
    }

    @IBOutlet weak var rollno: UIPickerView!
    
   
   
    @IBOutlet weak var div: UITextField!
    
    @IBOutlet weak var rdbms: UITextField!
    
    @IBOutlet weak var micro: UITextField!
    
    @IBOutlet weak var es: UITextField!
    
    @IBOutlet weak var wd: UITextField!
    
    var studData:[Stud_master] = []
    override func viewDidLoad() {
        super.viewDidLoad()
display()
        // Do any additional setup after loading the view.
    }
    
    func display(){
        let appd = UIApplication.shared.delegate as! AppDelegate
        let con = appd.persistentContainer.viewContext
        let  res = NSFetchRequest<Stud_master>(entityName: "Stud_master" )
        do{
            
            studData = try! con.fetch(res)
        }
    }
    
    @IBAction func add_Marks(_ sender: Any) {
        let appd = UIApplication.shared.delegate as! AppDelegate
        let con = appd.persistentContainer.viewContext
        let marks = Stud_marks(context: con)
        
        marks.div = div.text!
        marks.es = Int32(es.text!)!
        marks.rdbms = Int32(rdbms.text!)!
        marks.micro = Int32(micro.text!)!
        marks.wd = Int32(wd.text!)!
        marks.rollno = selectedStudent
        selectedStud_master?.addToToMarks(marks)
        
        do{
            try! con.save()
            let alert = UIAlertController(title: "Done", message: "Sucefullly Added Marks", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
            print("Succefully Added Marks")
        }catch{
            print("Error : \(error)")
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
