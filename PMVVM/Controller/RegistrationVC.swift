//
//  ViewController.swift
//  PMVVM
//
//  Created by krupa on 1/20/18.
//  Copyright © 2018 sa. All rights reserved.
//

import UIKit
import CoreData

class RegistrationVC: UIViewController {
    
    @IBOutlet weak var firstName:UITextField!
    @IBOutlet weak var lastName:UITextField!
    @IBOutlet weak var email:UITextField!
    @IBOutlet weak var password:UITextField!
    @IBOutlet weak var btnSave:UIButton!
    
    private var registrationViewModel:RegistrationViewModel!
    var userObject:NSManagedObject?
    
    //--------------------------------------------------------------
    //MARK:ViewLife cycle
    //--------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let user = userObject{
            firstName.text = user.value(forKey: "firstName") as? String
            lastName.text = user.value(forKey: "lastName") as? String
            email.text = user.value(forKey: "email") as? String
            password.text = user.value(forKey: "password") as? String
            btnSave.isHidden = true
        }else{
            btnSave.isHidden = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        userObject = nil
    }

    //--------------------------------------------------------------
    //MARK:Button Action
    //--------------------------------------------------------------

    @IBAction func btnSaveClicked(sender:UIButton){
        if(!firstName.text!.isEmpty && !lastName.text!.isEmpty && !email.text!.isEmpty && !password.text!.isEmpty){
            registrationViewModel = RegistrationViewModel(firstName: firstName.text!, lastName: lastName.text!, email: email.text!, password: password.text!)
            registrationViewModel.saveUserInfo()
            self.navigationController?.popViewController(animated: true)
        }else{
            displayAlert(message: "All Filed Required")
        }
    }
    
    func displayAlert(message:String){
        let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: "OK", style: .default) { (action) in}
        alertVC.addAction(buttonOk)
        self.present(alertVC, animated: true)
    }

}

