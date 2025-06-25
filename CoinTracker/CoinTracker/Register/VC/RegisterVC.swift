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
    
    override func loadView() {
        screen = RegisterView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.applyCryptoGradientBackground()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTextFields(delegate: self)
        viewModel.delegate(delegate: self)
    }
}

extension RegisterVC: RegisterViewProtocol {
    func tappedRegisterButton() {
        viewModel.registerUser(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "")
    }
    
    func tappedLoginButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterVC: RegisterViewModelProtocol {
    func sucessRegister() {
        let vc: MarketListVC = MarketListVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func errorRegister(errorMessage: String) {
        print(#function)
    }
    
    
}

extension RegisterVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let name: String = screen?.nameTextField.text ?? ""
        let email: String = screen?.emailTextField.text ?? ""
        let password: String = screen?.passwordTextField.text ?? ""
        
        if !name.isEmpty && !email.isEmpty && !password.isEmpty {
            screen?.signUpButton.isEnabled = true
            screen?.signUpButton.backgroundColor = .black
        } else {
            screen?.signUpButton.isEnabled = false
            screen?.signUpButton.backgroundColor = .lightGray
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
