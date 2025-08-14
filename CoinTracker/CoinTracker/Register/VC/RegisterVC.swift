//
//  RegisterVC.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 24/06/25.
//

import UIKit

class RegisterVC: UIViewController {
    
    private var screen: RegisterView?
    private var viewModel: RegisterViewModel = RegisterViewModel()
    private var alert: AlertController?
    
    override func loadView() {
        screen = RegisterView()
        view = screen
        alert = AlertController(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        dismissKeyboard()
        screen?.delegate(delegate: self)
        screen?.configTextFields(delegate: self)
        isEnabledRegisterButton(false)
    }
    
    func validateTextField() {
        let name = screen?.nameTextField.text ?? ""
        let email = screen?.emailTextField.text ?? ""
        let password = screen?.passwordTextField.text ?? ""
        
        let isValid = name.isValid(validType: .name) &&
                      email.isValid(validType: .email) &&
                      password.isValid(validType: .password)
        
        isEnabledRegisterButton(isValid)
    }
    
    func isEnabledRegisterButton(_ isEnabled: Bool) {
        if isEnabled {
            screen?.signUpButton.setTitleColor(.black, for: .normal)
            screen?.signUpButton.isEnabled = true
            screen?.signUpButton.alpha = 1
        } else {
            screen?.signUpButton.setTitleColor(.black, for: .normal)
            screen?.signUpButton.isEnabled = false
            screen?.signUpButton.alpha = 0.4
        }
    }

}

extension RegisterVC: RegisterViewProtocol {
    func tappedRegisterButton() {
        viewModel.registerUser(
            name: screen?.nameTextField.text ?? "",
            email: screen?.emailTextField.text ?? "",
            password: screen?.passwordTextField.text ?? ""
        )
    }
    
    func tappedLoginButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterVC: RegisterViewModelProtocol {
    func sucessRegister() {
        let tabBar = TabBarVC()
        if let sceneDelegate = UIApplication.shared.connectedScenes
            .first?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = tabBar
        }
    }
    
    func errorRegister(errorMessage: String) {
        alert?.getAlert(title: "Erro no Cadastro", message: errorMessage)
    }
}

extension RegisterVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case self.screen?.nameTextField:
                if (screen?.nameTextField.text ?? "").isValid(validType: .name) {
                    screen?.nameTextField.layer.borderWidth = 1
                    screen?.nameTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    screen?.nameTextField.layer.borderWidth = 1.5
                    screen?.nameTextField.layer.borderColor = UIColor.red.cgColor
                }
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
        if textField == screen?.nameTextField {
            screen?.emailTextField.becomeFirstResponder()
        } else if textField == screen?.emailTextField {
            screen?.passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
