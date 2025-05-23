//
//  ViewController.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/05/25.
//

import UIKit

class MarketListVC: UIViewController {
    
    private var screen: MarketListView?
    
    override func loadView() {
        screen = MarketListView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

