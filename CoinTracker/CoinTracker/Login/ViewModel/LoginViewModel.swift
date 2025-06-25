//
//  LoginViewModel.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/06/25.
//

import UIKit
import FirebaseAuth

protocol LoginViewModelProtocol: AnyObject {
    func sucessLogin()
    func errorLogin(errorMessage: String)
}

class LoginViewModel: NSObject {
    private weak var delegate: LoginViewModelProtocol?
    private var auth = Auth.auth()
    
    public func delegate(delegate: LoginViewModelProtocol?) {
        self.delegate = delegate
    }
    
    public func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso login")
                self.delegate?.sucessLogin()
            } else {
                print("Error login, error: \(error?.localizedDescription ?? "")")
                self.delegate?.errorLogin(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
}
