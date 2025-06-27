//
//  ViewController.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/05/25.
//

import UIKit
import FirebaseAuth

class MarketListVC: UIViewController {
    
    private var screen: MarketListView?
    private var viewModel: MarketListViewModel = MarketListViewModel()
    
    override func loadView() {
        screen = MarketListView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchRequest()
        viewModel.setDelegate(self)
        setupHelloLabel()
    }
    
    private func setupHelloLabel() {
        guard let user = Auth.auth().currentUser else { return }
        user.reload { [weak self] error in
            if let error = error {
                print("Erro ao recarregar usuário: \(error.localizedDescription)")
            } else {
                let updatedName = Auth.auth().currentUser?.displayName ?? "User"
                DispatchQueue.main.async {
                    self?.screen?.helloLabel.text = "Hello, \(updatedName)!"
                }
            }
        }
    }
    
}

extension MarketListVC: HomeViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.screen?.configTableViewProtocol(delegate: self, dataSource: self)
            self.screen?.tableView.reloadData()
        }
    }
    
    func error(message: String) {
        print("Erro")
    }
    
}

extension MarketListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier, for: indexPath) as? CoinTableViewCell
        cell?.setupHomeCell(data: viewModel.loadCurrentCoins(indexPath: indexPath))
        cell?.setTopSpacing(isFirst: indexPath.row == 0)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCoin = viewModel.loadCurrentCoins(indexPath: indexPath)
        let coinDetail = CoinDetailVC(coin: selectedCoin)
        present(coinDetail, animated: true)
    }
}
