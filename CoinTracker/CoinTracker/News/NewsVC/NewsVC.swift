//
//  NewsVC.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 05/06/25.
//

import UIKit
import SafariServices // utilizado p/ abrir páginas da web dentro do app com o Safari nativo (SFSafariViewController)

class NewsVC: UIViewController {
    
    private var screen: NewsView?
    private var viewModel: NewsViewModel = NewsViewModel()
    
    override func loadView() {
        screen = NewsView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchRequest()
        viewModel.setDelegate(delegate: self)
        screen?.tableView.estimatedRowHeight = 420
        screen?.tableView.rowHeight = UITableView.automaticDimension
    }
}

extension NewsVC: NewsViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.screen?.configTableViewProtocol(delegate: self, dataSource: self)
            self.screen?.tableView.reloadData()
        }
    }
    
    func error(message: String) {
        print(#function)
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentCoins(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.loadCurrentCoins(indexPath: indexPath)
        
        guard let urlString = article.url, let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
