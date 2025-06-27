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
    
    override func loadView() {
        screen = LoginView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
         navigationController?.navigationBar.isHidden = true
     }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        view.applyCryptoGradientBackground()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextFields(delegate: self)
        viewModel.delegate(delegate: self)
        screen?.emailTextField.text = "test@test.com"
        screen?.passwordTextField.text = "123456"
    }
}

extension LoginVC: LoginViewProtocol {
    func tappedLoginButton() {
        viewModel.login(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "")
    }
    
    func tappedRegisterButton() {
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginVC: LoginViewModelProtocol {
    func sucessLogin() {
        let tabBar = TabBarVC()
        if let sceneDelegate = UIApplication.shared.connectedScenes
            .first?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = tabBar
        }
    }
    
    func errorLogin(errorMessage: String) {
        print(#function)
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
        } else {
            screen?.signInButton.isEnabled = false
            screen?.signInButton.backgroundColor = .lightGray
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // Fechar o teclado ao tocar "return"
        textField.resignFirstResponder()
        return false
    }
}
