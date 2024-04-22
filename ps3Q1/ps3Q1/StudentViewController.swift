//
//  StudentViewController.swift
//  ps3Q1
//
//  Created by MSCICT2 on 08/04/24.
//

import UIKit
import CoreData

class StudentViewController: UIViewController {

    @IBOutlet weak var rollno: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var txtdiv: UITextField!
    @IBOutlet weak var sem: UITextField!
    
    @IBOutlet weak var area: UITextField!
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var bgp: UITextField!
    
    @IBOutlet weak var dob: UITextField!
    
    @IBOutlet weak var gender: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        print(path[0])
        // Do any additional setup after loading the view.
    }
    
    @IBAction func add_stud(_ sender: Any) {
        let appd = UIApplication.shared.delegate as! AppDelegate
        let con = appd.persistentContainer.viewContext
        
        let obj = Stud_master(context: con)
        
        obj.rollno = Int32(rollno.text!)!
        obj.name = name.text!
        obj.div = txtdiv.text!
        obj.sem = sem.text!
        obj.area = area.text!
        obj.city = city.text!
        obj.dob = dob.text!
        obj.bgp = bgp.text!
        obj.gender = gender.text!
        
        do{
            try! con.save()
            let alert = UIAlertController(title: "Done", message: "Sucefullly Added Student", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
            
            print("Successfully Added")
        }
    }
    
   
   

}
