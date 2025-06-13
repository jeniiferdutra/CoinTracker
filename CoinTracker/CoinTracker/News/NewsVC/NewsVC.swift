//
//  NewsVC.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 05/06/25.
//

import UIKit

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
    }
}

extension NewsVC: NewsViewModelProtocol {
    func success() {
        print(#function)
    }
    
    func error(message: String) {
        print(#function)
    }
    
    
}
