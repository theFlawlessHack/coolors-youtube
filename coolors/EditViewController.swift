//
//  EditViewController.swift
//  coolors
//
//  Created by Jessica Joseph on 1/22/18.
//  Copyright © 2018 Jessica Joseph. All rights reserved.
//

import UIKit

class EditViewController : UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneEditing(_ sender: Any) {
        if nameTextField.text != "" && colorTextField.text != "" {
            if CDHandler.saveObject(username: nameTextField.text!, color: colorTextField.text!) {
                for user in CDHandler.fetchObject()! {
                    print("\(user.username!)'s favorite color is \(user.color!)")
                }
            }
        }
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier:"initial")
        self.present(controller, animated: true, completion: nil)
    }
    
}
