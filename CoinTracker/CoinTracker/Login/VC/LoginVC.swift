//
//  LoginVC.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 18/06/25.
//

import UIKit

class LoginVC: UIViewController {
    
    private var screen: LoginView?
    private var viewModel: LoginViewModel = LoginViewModel()
    private var alert: AlertController?
    
    override func loadView() {
        screen = LoginView()
        view = screen
        alert = AlertController(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextFields(delegate: self)
        viewModel.delegate(delegate: self)
        // adiciona o tap para fechar teclado
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension LoginVC: LoginViewProtocol {
    func tappedLoginButton() {
        viewModel.login(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "")
    }
    
    func tappedGoogleButton() {
        viewModel.loginWithGoogle(presentingViewController: self)
    }
    
    func tappedFacebookButton() {
        viewModel.loginWithFacebook(from: self)
        print(#function)
    }
    
    func tappedGithubButton() {
        viewModel.loginWithGitHub(presentingViewController: self)
    }
    
    func tappedRegisterButton() {
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginVC: LoginViewModelProtocol {
    func sucessGoogleLogin() {
        sucessLogin()
    }
    
    func errorGoogleLogin(errorMessage: String) {
        print("Erro login Google: \(errorMessage)")
    }
    
    func sucessLogin() {
        let tabBar = TabBarVC()
        if let sceneDelegate = UIApplication.shared.connectedScenes
            .first?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = tabBar
        }
    }
    
    func errorLogin(errorMessage: String) {
        alert?.getAlert(title: "Oops!", message: "E-mail ou senha incorretos.")
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) { // Saber quando o campo terminou de ser editado
        
        let email: String = screen?.emailTextField.text ?? ""
        let password: String = screen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            screen?.signInButton.isEnabled = true
            screen?.signInButton.backgroundColor = .white
            screen?.signInButton.setTitleColor(.black, for: .normal)
            screen?.signInButton.layer.borderColor = UIColor.clear.cgColor
            screen?.signInButton.layer.borderWidth = 0
        } else {
            screen?.signInButton.isEnabled = false
            screen?.signInButton.backgroundColor = .lightGray
            screen?.signInButton.setTitleColor(.black, for: .disabled)
            screen?.signInButton.layer.borderColor = UIColor.red.cgColor
            screen?.signInButton.layer.borderWidth = 1.5
            screen?.signInButton.layer.cornerRadius = 15
            screen?.signInButton.clipsToBounds = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == screen?.emailTextField {
            screen?.passwordTextField.becomeFirstResponder() // vai para o próx campo
        } else {
            textField.resignFirstResponder() // fecha o teclado no último campo
        }
        return true
    }
}
