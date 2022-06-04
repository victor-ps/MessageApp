//
//  LoginScreen.swift
//  MessageApp
//
//  Created by Victor Andre de Paula e Silva on 26/5/2022.
//

import UIKit

protocol LogingScrennProtocol: AnyObject{
    func actionLoginButton()
    func actionSigninbutton()
    
}

class LoginScreen: UIView {
    
    weak private var delegate: LogingScrennProtocol?
    func delegate(delegate: LogingScrennProtocol){
        self.delegate = delegate
    }
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BlueGradient")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = UIColor(
            red: 65/255, green: 133/255, blue: 155/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    lazy var logoAppImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LogoW")
        image.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Type your email."
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.placeholder = "Type your password."
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.lightGray, for: .normal)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 48/255, green: 85/255, blue: 157/255, alpha: 1.0)
        button.addTarget(self, action: #selector(pressedLogingButton), for: .touchUpInside)
        return button
    }()
    
    lazy var signinButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Don't have any account? Sign up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(pressedSigninButton), for: .touchUpInside)
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        
        //-----Constraints------
        self.configBackgoundImageConstraints()
        self.configLoginLabelConstraints()
        self.configLogoAppConstriants()
        self.configEmailTextFieldConstraints()
        self.configPasswordTextFieldConstraints()
        self.configLoginButtonConstraints()
        self.configSiginButtonConstraints()
        
        
    }
    
    private func configSuperView(){
        addSubview(self.backgroundImageView)
        addSubview(self.loginLabel)
        addSubview(self.logoAppImage)
        addSubview(self.emailTextField)
        addSubview(self.passwordTextField)
        addSubview(self.loginButton)
        addSubview(self.signinButton)
    }
    
 
    
    @objc private func pressedLogingButton(){
        self.delegate?.actionLoginButton()
        
    }
    
    @objc private func pressedSigninButton(){
        self.delegate?.actionSigninbutton()
        
    }
    public func validateTextFields(){
        let email = self.emailTextField.text ?? ""
        let password = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButton(true)
        }else {
            self.configButton(false)
        }
        
    }
    private func configButton(_ enable:Bool){
        if enable {
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }else{
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
        
    }
    
    public func getEmail()->String{
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword()-> String{
        return self.passwordTextField.text ?? ""
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configBackgoundImageConstraints(){
        self.backgroundImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    func configLoginLabelConstraints(){
        self.loginLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    func configLogoAppConstriants(){
        self.logoAppImage.snp.makeConstraints { make in
            make.top.equalTo(self.loginLabel.snp.bottom).offset(20)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(60)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).inset(60)
            make.height.equalTo(150)
        }
    }
    func configEmailTextFieldConstraints(){
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.logoAppImage.snp.bottom).offset(50)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(20)
            make.height.equalTo(45)
        }
    }
    func configPasswordTextFieldConstraints(){
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(20)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    func configLoginButtonConstraints(){
        self.loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    func configSiginButtonConstraints(){
        self.signinButton.snp.makeConstraints { make in
            make.top.equalTo(self.loginButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.loginButton.snp.width)
            make.height.equalTo(self.loginButton.snp.height)
        }
    }
    
    
    
    
}

