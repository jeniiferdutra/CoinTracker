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
            
            if let error = error {
                print("Erro ao criar usuário: \(error.localizedDescription)")
                self.delegate?.errorRegister(errorMessage: error.localizedDescription)
                return
            }
            
            let changeRequest = result?.user.createProfileChangeRequest()
            changeRequest?.displayName = name
            changeRequest?.commitChanges(completion: { error in
                if let error = error {
                    print("Erro ao atualizar nome: \(error.localizedDescription)")
                } else {
                    print("Nome atualizado com sucesso para: \(name)")
                }
                self.delegate?.sucessRegister()
            })
        }
    }
}
