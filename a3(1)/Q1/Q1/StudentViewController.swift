//
//  StudentViewController.swift
//  Q1
//
//  Created by MSCICT2 on 4/8/24.
//

import UIKit
import CoreData

class StudentViewController: UIViewController {

    @IBOutlet weak var txtroll: UITextField!
    @IBOutlet weak var txtsem: UITextField!
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtdiv: UITextField!
    @IBOutlet weak var txtarea: UITextField!
    @IBOutlet weak var txtcity: UITextField!
    @IBOutlet weak var txtdob: UITextField!
    @IBOutlet weak var txtbgp: UITextField!
    @IBOutlet weak var txtgender: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func addstud(_ sender: Any) {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        let obj = Student(context:con)
        
        obj.rollno = Int32(txtroll.text!)!
        obj.sem = txtsem.text!
        obj.name = txtname.text!
        obj.area = txtarea.text!
        obj.city = txtcity.text!
        obj.bgp = txtbgp.text!
        obj.div = txtdiv.text!
        obj.dob = txtdob.text!
        obj.gender = txtgender.text!
        
        do{
            try! con.save()
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
            print("Added Succesfully")
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
