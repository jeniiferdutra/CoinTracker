//
//  CoinDetailVC.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 05/06/25.
//

import UIKit

class CoinDetailVC: UIViewController {
    
    private var screen: CoinDetailView?
    
    override func loadView() {
        screen = CoinDetailView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
