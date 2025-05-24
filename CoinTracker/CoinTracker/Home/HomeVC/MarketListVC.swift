//
//  ViewController.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/05/25.
//

import UIKit

class MarketListVC: UIViewController {
    
    private var screen: MarketListView?
    private var viewModel: MarketListViewModel = MarketListViewModel()
    
    override func loadView() {
        screen = MarketListView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel.fetchRequest()
        viewModel.setDelegate(self)
    }

}

extension MarketListVC: HomeViewModelProtocol {
    func success() {
        print("sucesso")
    }
    
    func error(message: String) {
        print("Erro")
    }
    
    
}
