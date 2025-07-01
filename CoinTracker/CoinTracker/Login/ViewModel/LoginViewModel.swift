//
//  LoginViewModel.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/06/25.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import GoogleSignInSwift
import SafariServices

protocol LoginViewModelProtocol: AnyObject {
    func sucessLogin()
    func errorLogin(errorMessage: String)
    func sucessGoogleLogin()
    func errorGoogleLogin(errorMessage: String)
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
    
    public func loginWithGoogle(presentingViewController: UIViewController) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            delegate?.errorGoogleLogin(errorMessage: "ClientID Firebase não encontrado.")
            return
        }
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { [weak self] result, error in
            if let error = error {
                self?.delegate?.errorGoogleLogin(errorMessage: error.localizedDescription)
                return
            }
            
            guard
                let user = result?.user,
                let idToken = user.idToken?.tokenString
            else {
                self?.delegate?.errorGoogleLogin(errorMessage: "Erro ao obter tokens.")
                return
            }
            
            let accessToken = user.accessToken.tokenString
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            self?.auth.signIn(with: credential) { authResult, error in
                if let error = error {
                    self?.delegate?.errorGoogleLogin(errorMessage: error.localizedDescription)
                } else {
                    self?.delegate?.sucessGoogleLogin()
                }
            }
        }
    }
    
    func loginWithGitHub(presentingViewController: UIViewController) {
        let clientID = "Ov23li6vYGAPMuwyfgl7"
        let redirectURI = "https://cointracker-e726b.firebaseapp.com/__/auth/handler"
        let scope = "read:user user:email"
        let state = UUID().uuidString
        
        let urlString = """
        https://github.com/login/oauth/authorize?client_id=\(clientID)&redirect_uri=\(redirectURI)&scope=\(scope)&state=\(state)
        """
        
        if let url = URL(string: urlString) {
            let safariVC = SFSafariViewController(url: url)
            presentingViewController.present(safariVC, animated: true, completion: nil)
        }
    }
}
