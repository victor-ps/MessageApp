//
//  RegisterScreen.swift
//  MessageApp
//
//  Created by Victor Andre de Paula e Silva on 26/5/2022.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject{
    func actionSignin()
    func actionBack()
    
}


class RegisterScreen: UIView {

    weak private var delegate: RegisterScreenProtocol?
    func delegate(delegate: RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BlueGradient")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        button.addTarget(self, action: #selector(pressedBack), for: .touchUpInside)
        return button
    }()
    
    lazy var signinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign In"
        label.textColor = UIColor(red: 65/255, green: 133/255, blue: 155/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    lazy var userLogoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")
        image.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Type your email."
        textfield.borderStyle = .roundedRect
                return textfield
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.placeholder = "Type your password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var signinButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.isEnabled = false
        button.backgroundColor = UIColor(red: 48/255, green: 85/255, blue: 157/255, alpha: 1.0)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pressedSignin), for: .touchUpInside)
        return button
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configSuperView()
        self.configConstraints()
    }
    
    
    private func configSuperView(){
        addSubview(self.backgroundImageView)
        addSubview(self.backButton)
        addSubview(self.signinLabel)
        addSubview(self.userLogoImageView)
        addSubview(self.emailTextField)
        addSubview(self.passwordTextField)
        addSubview(self.signinButton)
    }
    
    
    
    
    @objc private func pressedBack(){
        self.delegate?.actionBack()
        
    }
    
    @objc private func pressedSignin(){
        self.delegate?.actionSignin()
    }
    
    public func validateTextFields(){
        let email:String = self.emailTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty{
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    private func configButtonEnable(_ enable: Bool){
        if enable{
            self.signinButton.setTitleColor(.white, for: .normal)
            self.signinButton.isEnabled = true
        }else{
            self.signinButton.setTitleColor(.lightGray, for: .normal)
            self.signinButton.isEnabled = false
        }
    }
    
    
    public func getEmail()-> String{
        return self.emailTextField.text ?? ""
    }
    public func getPassword()-> String{
        return self.passwordTextField.text ?? ""
    }
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }

    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configConstraints(){
        
        NSLayoutConstraint.activate([
            
            //Backgound Image
            self.backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //Back Button
            self.backButton.topAnchor.constraint(equalTo: signinLabel.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            //Signin Label
            self.signinLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.signinLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            //Logo image
            self.userLogoImageView.topAnchor.constraint(equalTo: signinLabel.bottomAnchor,constant: 20),
            self.userLogoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 60),
            self.userLogoImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -60),
            self.userLogoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            //Email textField
            self.emailTextField.topAnchor.constraint(equalTo: userLogoImageView.bottomAnchor,constant: 50),
            self.emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            //Password textField
            self.passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            //Signin Button
            self.signinButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 20),
            self.signinButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.signinButton.widthAnchor.constraint(equalToConstant: 250),
            self.signinButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
            
        
        
        ])
        
        
    }
}
