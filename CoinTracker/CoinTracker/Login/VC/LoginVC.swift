//
//  LoginVC.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 18/06/25.
//

import UIKit

class LoginVC: UIViewController {
    
    private var screen: LoginView?
    
    override func loadView() {
        screen = LoginView()
        view = screen
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.applyCryptoGradientBackground()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
