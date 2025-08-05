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
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setDelegate(self)
        viewModel.fetchRequest(.mock)
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
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}

extension MarketListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as? HeaderTableViewCell
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SectionLabelTableViewCell.identifier, for: indexPath) as? SectionLabelTableViewCell
            return cell ?? UITableViewCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier, for: indexPath) as? CoinTableViewCell
            cell?.setupHomeCell(data: viewModel.loadCurrentCoins(indexPath: indexPath))
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 70
        default:
            return 85 
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row >= 2 else { return }
        let selectedCoin = viewModel.loadCurrentCoins(indexPath: indexPath)
        let coinDetail = CoinDetailVC(coin: selectedCoin)
        present(coinDetail, animated: true)
    }

}

