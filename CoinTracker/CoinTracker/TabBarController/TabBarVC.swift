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
        let home = UINavigationController(rootViewController: MarketListViewController())
        let news = UINavigationController(rootViewController: NewsViewController())
        let profile = UINavigationController(rootViewController: ProfileVC())
        
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        news.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 1)
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 2)
        
        setViewControllers([home, news, profile], animated: false)
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .white
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = UIColor(red: 35/255, green: 33/255, blue: 45/255, alpha: 1.0)
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        guard let itens = tabBar.items else { return }
        
        itens[0].image = UIImage(systemName: "homekit")
        itens[1].image = UIImage(systemName: "newspaper")
        itens[2].image = UIImage(systemName: "person")
    }
}
