//
//  RegisterViewController.swift
//  MessageApp
//
//  Created by Victor Andre de Paula e Silva on 26/5/2022.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    var auth: Auth?
    var alert: Alert?
    
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
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
extension RegisterViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validateTextFields()
    }
}

extension RegisterViewController: RegisterScreenProtocol{
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionSignin() {
        guard let screen = self.registerScreen else {return}
        
        self.auth?.createUser(withEmail: screen.getEmail(), password: screen.getPassword(), completion: { result, error in
            if error != nil{
                self.alert?.getAlert(title: "Attention", message: "Error resgistring, try again")
//                print("Error  restering")
            } else{
                self.alert?.getAlert(title: "Congratulation", message: "Sign in sucessful.", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
                print("Sucessful")
            }
        })
        
    }
    
    
    
}


