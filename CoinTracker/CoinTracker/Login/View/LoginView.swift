//
//  LoginView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 18/06/25.
//

import UIKit

class LoginView: UIView {
    
    lazy var logoImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logo")
        return img
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
        email.borderStyle = .roundedRect
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
        password.borderStyle = .roundedRect
        password.isSecureTextEntry = true
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
        btn.layer.cornerRadius = 8
        //btn.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return btn
    }()
    
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
    
    lazy var xImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "x")
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(logoImageView)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(signInButton)
        addSubview(signInLabel)
        addSubview(googleImageView)
        addSubview(xImageView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            emailLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            signInButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            signInLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
            signInLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            googleImageView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 20),
            googleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            
            xImageView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 20),
            xImageView.leadingAnchor.constraint(equalTo: googleImageView.trailingAnchor, constant: 30),
            xImageView.heightAnchor.constraint(equalToConstant: 35),
            xImageView.widthAnchor.constraint(equalToConstant: 35),
            
        ])
    }

}
