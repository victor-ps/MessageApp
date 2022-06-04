//
//  ViewController.swift
//  MessageApp
//
//  Created by Victor Andre de Paula e Silva on 26/5/2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    

    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.loginScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }


}

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validateTextFields()
    }
}

extension LoginViewController: LogingScrennProtocol{
    func actionLoginButton() {
//        guard let login = self.loginScreen else {return}
//
//        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { result, error in
//            if error != nil{
//                self.alert?.getAlert(title: "Incorrect Details", message: "Check your details and try again.")
////                print("Dados incorretos, tente novamente")
//            }else if result == nil {
//                self.alert?.getAlert(title: "Sorry", message: "Unexpected error, try again")
////                print("Tievemos um problema")
//            }else{
//                self.alert?.getAlert(title: "Congratulation", message: "Login sucessful", completion: nil)
////                print("Logado com sucesso")
//            }
//        })
//
        
    }
    
    func actionSigninbutton() {
        
        
        let registerViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    
    
}
    
    


