//
//  AssgnmentViewController.swift
//  Q3
//
//  Created by MSCICT2 on 4/9/24.
//

import UIKit
import CoreData

class AssgnmentViewController: UIViewController {

    @IBOutlet weak var txtno: UITextField!
    
    @IBOutlet weak var txtsub: UITextField!
    
    @IBOutlet weak var txtdate: UITextField!
    
    @IBOutlet weak var txtfaculty: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addbtn(_ sender: Any) {
        let appD = UIApplication.shared.delegate as! AppDelegate
        let con = appD.persistentContainer.viewContext
        let obj = Assignment(context:con)
                
        obj.assgno = Int32(txtno.text!)!
        obj.assgdate = txtdate.text!
        obj.subject = txtsub.text!
        obj.faculty = txtfaculty.text!

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
