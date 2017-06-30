//
//  CoreDataViewController.swift
//  SwiftTutorial20170627
//
//  Created by ParkD on 2017. 6. 30..
//  Copyright © 2017년 ParkD. All rights reserved.
//
    
import UIKit
import CoreData

class CoreDataViewController: UIViewController {

    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func saveContact(_ sender: Any) {
        let entity = NSEntityDescription.entity(forEntityName: "Contacts", in: context)
        
        let contact = Contacts(entity: entity!, insertInto: context)
        
        contact.name = nameTextField.text
        contact.address = addressTextField.text
        contact.phone = phoneTextField.text
        
        do{
            try context.save()
            nameTextField.text = ""
            addressTextField.text = ""
            phoneTextField.text = ""
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
