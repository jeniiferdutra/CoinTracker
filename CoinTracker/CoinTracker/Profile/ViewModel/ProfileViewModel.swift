//
//  ProfileViewModel.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 01/07/25.
//

import UIKit
import FirebaseAuth

class ProfileViewModel: NSObject {
    
    public var userName: String {
        return Auth.auth().currentUser?.displayName ?? "Usuário sem nome"
    }
    
    public var userEmail: String {
        return Auth.auth().currentUser?.email ?? "Email não encontrado"
    }
    
    public var isUserLoggedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    public func logout(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
}
