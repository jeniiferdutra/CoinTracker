//
//  NewsVC.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 05/06/25.
//

import UIKit

class NewsVC: UIViewController {
    
    private var screen: NewsView?
    
    override func loadView() {
        screen = NewsView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
