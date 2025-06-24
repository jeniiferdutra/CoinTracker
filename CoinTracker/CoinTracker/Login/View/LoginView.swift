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
        //btn.addTarget(self, action: #selector(), for: .touchUpInside)
        return btn
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
        addSubview(facebookImageView)
        addSubview(githubImageView)
        addSubview(signUpLabel)
        addSubview(signUpButton)
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
            
            signUpLabel.topAnchor.constraint(equalTo: facebookImageView.bottomAnchor, constant: 80),
            signUpLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            
            signUpButton.topAnchor.constraint(equalTo: githubImageView.bottomAnchor, constant: 74),
            signUpButton.leadingAnchor.constraint(equalTo: signUpLabel.trailingAnchor, constant: 5),
            
        ])
    }

}
