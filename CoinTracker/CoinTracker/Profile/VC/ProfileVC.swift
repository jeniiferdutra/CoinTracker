//
//  ProfileVC.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 01/07/25.
//

import UIKit
import FirebaseAuth

class ProfileVC: UIViewController {
    
    private var screen: ProfileView?
    private let viewModel = ProfileViewModel()
    
    override func loadView() {
        screen = ProfileView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.setupUserData(name: viewModel.userName, email: viewModel.userEmail)
    }
}

extension ProfileVC: ProfileViewProtocol {
    func logoutTapped() {
        viewModel.logout { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    let loginVC = LoginVC()
                    let nav = UINavigationController(rootViewController: loginVC)
                    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let window = scene.windows.first {
                        window.rootViewController = nav
                        window.makeKeyAndVisible()
                    }
                }
            case .failure(let error):
                print("Erro ao deslogar: \(error.localizedDescription)") // MARK: Adicicionar um alert
            }
        }
    }
}
