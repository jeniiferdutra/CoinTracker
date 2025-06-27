//
//  LoginView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 18/06/25.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func tappedLoginButton()
    func tappedRegisterButton()
}

class LoginView: UIView {
    
    private weak var delegate: LoginViewProtocol?
    
    public func delegate(delegate: LoginViewProtocol?) {
        self.delegate = delegate
    }
    
    lazy var logoImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logo")
        return img
    }()
    
    lazy var loginLabel: UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = "Login"
        email.textColor = .white
        email.font = UIFont.boldSystemFont(ofSize: 26)
        return email
    }()
    
    lazy var emailLabel: UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.text = "Email"
        email.textColor = .white
        email.font = UIFont.systemFont(ofSize: 14)
        return email
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.placeholder = "Enter your email"
        email.textColor = .white
        email.font = UIFont.systemFont(ofSize: 14)
        email.keyboardType = .emailAddress
        email.autocorrectionType = .no
        email.backgroundColor = UIColor(white: 1, alpha: 0.1)
        email.layer.cornerRadius = 15
        email.clipsToBounds = true
        email.layer.borderWidth = 0.3
        email.layer.borderColor = UIColor.lightGray.cgColor
        email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        email.leftViewMode = .always
        email.borderStyle = .none
        return email
    }()
    
    lazy var passwordLabel: UILabel = {
        let password = UILabel()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.text = "Password"
        password.textColor = .white
        password.font = UIFont.systemFont(ofSize: 14)
        return password
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "Enter your password"
        password.textColor = .white
        password.font = UIFont.systemFont(ofSize: 14)
        password.backgroundColor = UIColor(white: 1, alpha: 0.1)
        password.layer.cornerRadius = 15
        password.clipsToBounds = true
        password.layer.borderWidth = 0.3
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.isSecureTextEntry = true
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        password.leftViewMode = .always
        password.borderStyle = .none
        return password
    }()
    
    lazy var signInButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sign In", for: .normal)
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.setTitleColor(.black, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 15
        btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedLoginButton() {
        self.delegate?.tappedLoginButton()
    }
    
    lazy var signInLabel: UILabel = {
        let signIn = UILabel()
        signIn.translatesAutoresizingMaskIntoConstraints = false
        signIn.text = "Or sign in with"
        signIn.textColor = .white
        signIn.font = UIFont.systemFont(ofSize: 14)
        return signIn
    }()
    
    lazy var googleImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "google")
        return img
    }()
    
    lazy var facebookImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "facebook")
        return img
    }()
    
    lazy var githubImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "github")
        return img
    }()
    
    lazy var signUpContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var signUpLabel: UILabel = {
        let signIn = UILabel()
        signIn.translatesAutoresizingMaskIntoConstraints = false
        signIn.text = "Don't have an account?"
        signIn.textColor = .white
        signIn.font = UIFont.systemFont(ofSize: 14)
        return signIn
    }()
    
    lazy var signUpButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedRegisterButton() {
        self.delegate?.tappedRegisterButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 23/255, green: 21/255, blue: 32/255, alpha: 1.0)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(logoImageView)
        addSubview(loginLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(signInButton)
        addSubview(signInLabel)
        addSubview(googleImageView)
        addSubview(facebookImageView)
        addSubview(githubImageView)
        addSubview(signUpContainerView)
        signUpContainerView.addSubview(signUpLabel)
        signUpContainerView.addSubview(signUpButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            loginLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            signInButton.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            signInLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
            signInLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            googleImageView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 20),
            googleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 120),
            googleImageView.heightAnchor.constraint(equalToConstant: 45),
            googleImageView.widthAnchor.constraint(equalToConstant: 45),
            
            facebookImageView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 20),
            facebookImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            facebookImageView.heightAnchor.constraint(equalToConstant: 45),
            facebookImageView.widthAnchor.constraint(equalToConstant: 45),
            
            githubImageView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 20),
            githubImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -120),
            githubImageView.heightAnchor.constraint(equalToConstant: 45),
            githubImageView.widthAnchor.constraint(equalToConstant: 45),
            
            signUpContainerView.topAnchor.constraint(equalTo: facebookImageView.bottomAnchor, constant: 80),
            signUpContainerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            signUpLabel.topAnchor.constraint(equalTo: signUpContainerView.topAnchor),
            signUpLabel.leadingAnchor.constraint(equalTo: signUpContainerView.leadingAnchor),

            signUpButton.centerYAnchor.constraint(equalTo: signUpLabel.centerYAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: signUpLabel.trailingAnchor, constant: 5),
            signUpButton.trailingAnchor.constraint(equalTo: signUpContainerView.trailingAnchor)
            
        ])
    }
    
    public func configTextFields(delegate: UITextFieldDelegate) { // a VC vai ser responsável por lidar com os eventos desses campos.
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}
