//
//  PromoterViewController.swift
//  Book My Band
//
//  Created by Matt Huston on 9/13/18.
//  Copyright © 2018 Matt Huston. All rights reserved.
//

import UIKit

class PromoterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var Location: UITextField!
    @IBOutlet weak var Date: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Location.delegate = self
        Date.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Location.resignFirstResponder()
        Date.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == Location {
            textField.resignFirstResponder()
            Date.becomeFirstResponder()
        } else if textField == Date {
            textField.resignFirstResponder()
        }
        return true
    }
}

//extension ViewController : UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        textField.resignFirstResponder()
//        return true
//    }
//}

