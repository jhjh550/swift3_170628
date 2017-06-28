//
//  ValueViewController.swift
//  SwiftTutorial20170627
//
//  Created by ParkD on 2017. 6. 28..
//  Copyright © 2017년 ParkD. All rights reserved.
//

import UIKit

class ValueViewController: UIViewController {

    @IBOutlet var stepperInterval: UIStepper!
    @IBOutlet var switchUpdate: UISwitch!
    @IBOutlet var labelInterval: UILabel!
    @IBOutlet var labelUpdate: UILabel!
    @IBOutlet var textFieldEmail: UITextField!
    
    @IBAction func onSwitch(_ sender: Any) {
        let mySender = sender as! UISwitch
        if(mySender.isOn){
            labelUpdate.text = "Update"
        }else{
            labelUpdate.text = "Not Update"
        }
    }
    
    @IBAction func onStepper(_ sender: Any) {
        let myStepper = sender as! UIStepper
        labelInterval.text = "\(Int(myStepper.value))분"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        if let rvc = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ValueResultViewController{
            
            rvc.email = textFieldEmail.text!
            rvc.update = switchUpdate.isOn
            rvc.interval = stepperInterval.value
            
            self.present(rvc, animated: true, completion: nil)
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
