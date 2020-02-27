//
//  ViewController.swift
//  iOS-Swift-TextEnteryValidity
//
//  Created by Pooya on 2020-02-26.
//  Copyright © 2020 centurytrail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextfield : UITextField!
    @IBOutlet weak var nameMessage : UILabel!
    @IBOutlet weak var emailTextfield : UITextField!
    @IBOutlet weak var emailMessage : UILabel!
    @IBOutlet weak var phoneTextfield : UITextField!
    @IBOutlet weak var phoneMessage : UILabel!
    @IBOutlet weak var passTextfield : UITextField!
    @IBOutlet weak var passMessage : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func name_act(_ sender: Any){
        let text = nameTextfield.text ?? ""
        if text.isValidName() {
            nameTextfield.textColor = UIColor.black
            nameMessage.text = ""
        } else {
            nameTextfield.textColor = UIColor.red
            nameMessage.text = "not valid name"
        }
    }

    @IBAction func email_act(_ sender: Any){
        let text = emailTextfield.text ?? ""
        if text.isValidEmail() {
            emailTextfield.textColor = UIColor.black
            emailMessage.text = ""
        } else {
            emailTextfield.textColor = UIColor.red
            emailMessage.text = "not valid email"
        }
    }

    @IBAction func phone_act(_ sender: Any){
        let text = phoneTextfield.text ?? ""
        if text.filterPhoneNumber().isValidPhone() {
            phoneTextfield.textColor = UIColor.black
            phoneMessage.text = ""
        } else {
            phoneTextfield.textColor = UIColor.red
            phoneMessage.text = "not valid phone"
        }
    }

    @IBAction func pass_act(_ sender: Any){
        let text = passTextfield.text ?? ""
        if text.isValidPassword() {
            passTextfield.textColor = UIColor.black
            passMessage.text = "Strong Password"
            passMessage.textColor = UIColor.green
        } else {
            passTextfield.textColor = UIColor.red
            passMessage.text = "Weak password"
            passMessage.textColor = UIColor.red
        }
    }

    

}


extension String {
    func isValidName() -> Bool {
        let inputRegEx = "^[a-zA-Z\\_]{2,25}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    func isValidEmail() -> Bool {
        let inputRegEx = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[A-Za-z]{2,64}"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    func isValidPhone() -> Bool {
        let inputRegEx = "^((\\+)|(00))[0-9]{6,14}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    func isValidPassword() -> Bool {
        let inputRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()-_+={}?>.<,:;~`']{8,}$"
        let inputpred = NSPredicate(format: "SELF MATCHES %@", inputRegEx)
        return inputpred.evaluate(with:self)
    }
    
    public func filterPhoneNumber() -> String {
        return String(self.filter {!" ()._-\n\t\r".contains($0)})
    }
}

