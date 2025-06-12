//
//  TabBarVC.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 05/06/25.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let home = UINavigationController(rootViewController: MarketListVC())
        let news = UINavigationController(rootViewController: NewsVC())
        setViewControllers([home, news], animated: false)
        tabBar.isTranslucent = false
        tabBar.tintColor = .white
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = UIColor(red: 23/255, green: 21/255, blue: 32/255, alpha: 1.0)
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        guard let itens = tabBar.items else { return }
        
        itens[0].image = UIImage(systemName: "homekit")
        itens[1].image = UIImage(systemName: "newspaper")
    }
}
