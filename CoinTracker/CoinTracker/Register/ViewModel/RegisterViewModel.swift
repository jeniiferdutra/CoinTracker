//
//  RegisterViewModel.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 24/06/25.
//

import UIKit
import FirebaseAuth

protocol RegisterViewModelProtocol: AnyObject {
    func sucessRegister()
    func errorRegister(errorMessage: String)
}

class RegisterViewModel: NSObject {
    private weak var delegate: RegisterViewModelProtocol?
    private var auth = Auth.auth()
    
    public func delegate(delegate: RegisterViewModelProtocol?) { 
        self.delegate = delegate
    }
    
    public func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso cadastro")
                self.delegate?.sucessRegister()
            } else {
                print("Error cadastro, error: \(error?.localizedDescription ?? "")")
                self.delegate?.errorRegister(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
}

