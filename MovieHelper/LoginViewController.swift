//
//  LoginViewController.swift
//  MovieHelper
//
//  Created by Mehmet Eroğlu on 19.04.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import TextFieldEffects


class LoginViewController : BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: AkiraTextField!
    @IBOutlet weak var passwordTextField: AkiraTextField!
    
    var user : Register?
    
    var slideMenuViewController:SlideMenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        nameTextField.delegate = self
        passwordTextField.delegate = self

      
//         1.yol klavyeye button ekleme
//        let toolBar = UIToolbar()
//        toolBar.sizeToFit()
//        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
//        
//        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
//        toolBar.setItems([flexibleSpace, doneButton], animated: true)
//        
//        nameTextField.inputAccessoryView = toolBar
//        passwordTextField.inputAccessoryView = toolBar
    }

//  klavyedeki done buttonu tıklanınca yapılacaklar
//    func doneClicked() {
//        view.endEditing(true)
//    }
  
    //hide keyboard when user touches outside of Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // presses Geç key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameTextField {
            passwordTextField.becomeFirstResponder()
            
        }else if textField == passwordTextField{
            
            passwordTextField.resignFirstResponder()
           // passwordTextField.returnKeyType = UIReturnKeyType.done
        }
        
        return true
    }
    
    
    // tap gesture recognizer function
    @IBAction func closeViewClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func gonderButtonClicked(_ sender: Any) {
        var error:String?
        if nameTextField.text == "" {
            showAlertDialog(title: "Hata", message: "Lütfen mailinizi giriniz!", btnText: "Ok", complete:{
                
            })
            error = "Lütfen mailinizi giriniz"
        } else if passwordTextField.text == "" {
            showAlertDialog(title: "Hata!", message: "Lütfen şifrenizi giriniz!", btnText: "Ok", complete: { 
                
            })
            error = "Lütfen şifrenizi giriniz."
        }
        
        if error != nil {
            print(error!)
        } else {
            var parameters = [String: Any]()
            parameters["email"] = nameTextField.text
            parameters["password"] = passwordTextField.text
            WebService2.request(uri: "register", methot: .post, parameters: parameters, success: { (response:Register) in
                self.user = response
                let defaults = UserDefaults.standard
                defaults.set(self.user?.token, forKey: "token")
                TokenCheck.instance.token = response.token!
                self.showAlertDialog(title: "Tebrikler", message: "Kaydınız başarıyla kaydedildi.", btnText: "Tamam", complete: {
                    self.dismiss(animated: true, completion: nil)
//                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callSetupMenuItem"), object: nil)
                    NotificationCenter.default.post(name: Notification.Name("callSetupMenuItem"), object: nil)
                    
                })
                
            }, failure: { (error:Error) in
                self.showAlertDialog(title: "HATA", message: "Kaydınız yapılamamıştır. Lütfen tekrar deneyiniz!", btnText: "Ok", complete: {
                    
                })
            
                print(error.error)
            })
        }
    }
    
 
    
    
    
}
