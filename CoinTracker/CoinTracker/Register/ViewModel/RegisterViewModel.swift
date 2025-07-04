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
    
    public func registerUser(name: String, email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error as NSError? {
                if let errorCode = AuthErrorCode(rawValue: error.code) {
                    var message: String
                    
                    switch errorCode {
                    case .emailAlreadyInUse:
                        message = "Este e-mail já está cadastrado."
                    case .invalidEmail:
                        message = "O e-mail informado é inválido."
                    case .weakPassword:
                        message = "A senha deve conter pelo menos 6 caracteres."
                    default:
                        message = "Erro ao criar conta. Tente novamente."
                    }
                    
                    self.delegate?.errorRegister(errorMessage: message)
                    return
                }
            }
            
            // atualizar o nome do usuário no Firebase Authentication
            let changeRequest = result?.user.createProfileChangeRequest()
            changeRequest?.displayName = name
            changeRequest?.commitChanges(completion: { _ in
                self.delegate?.sucessRegister()
            })
        }
    }
}
