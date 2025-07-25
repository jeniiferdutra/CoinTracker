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
        dismissKeyboard()
        screen?.delegate(delegate: self)
        screen?.configTextFields(delegate: self)
        viewModel.delegate(delegate: self)
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
        
        let name: String = screen?.nameTextField.text ?? ""
        let email: String = screen?.emailTextField.text ?? ""
        let password: String = screen?.passwordTextField.text ?? ""
        
        if !name.isEmpty && !email.isEmpty && !password.isEmpty {
            screen?.signUpButton.isEnabled = true
            screen?.signUpButton.backgroundColor = .white
            screen?.signUpButton.setTitleColor(.black, for: .normal)
            screen?.signUpButton.layer.borderColor = UIColor.clear.cgColor
            screen?.signUpButton.layer.borderWidth = 0
        } else {
            screen?.signUpButton.isEnabled = false
            screen?.signUpButton.backgroundColor = .lightGray
            screen?.signUpButton.setTitleColor(.black, for: .disabled)
            screen?.signUpButton.layer.borderColor = UIColor.red.cgColor
            screen?.signUpButton.layer.borderWidth = 1.5
            screen?.signUpButton.layer.cornerRadius = 15
            screen?.signUpButton.clipsToBounds = true
        }
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
