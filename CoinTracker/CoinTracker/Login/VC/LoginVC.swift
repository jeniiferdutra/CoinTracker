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
        dismissKeyboard()
        screen?.delegate(delegate: self)
        screen?.configTextFields(delegate: self)
        viewModel.delegate(delegate: self)
        isEnabledLoginButton(false)
    }
    
    func validateTextField() {
        if (screen?.emailTextField.text ?? "").isValid(validType: .email) && (screen?.passwordTextField.text ?? "").isValid(validType: .password) {
            isEnabledLoginButton(true)
        } else {
            isEnabledLoginButton(false)
        }
    }
    
    func isEnabledLoginButton(_ isEnabled: Bool) {
        if isEnabled {
            screen?.signInButton.setTitleColor(.black, for: .normal)
            screen?.signInButton.isEnabled = true
            screen?.signInButton.alpha = 1
        } else {
            screen?.signInButton.setTitleColor(.black, for: .normal)
            screen?.signInButton.isEnabled = false
            screen?.signInButton.alpha = 0.4
        }
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

extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) { // Saber quando o campo terminou de ser editado
        
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case self.screen?.emailTextField:
                if (screen?.emailTextField.text ?? "").isValid(validType: .email) {
                    screen?.emailTextField.layer.borderWidth = 1
                    screen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    screen?.emailTextField.layer.borderWidth = 1.5
                    screen?.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
            case self.screen?.passwordTextField:
                if (screen?.passwordTextField.text ?? "").isValid(validType: .password) {
                    screen?.passwordTextField.layer.borderWidth = 1
                    screen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    screen?.passwordTextField.layer.borderWidth = 1.5
                    screen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
        }
        validateTextField()
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
