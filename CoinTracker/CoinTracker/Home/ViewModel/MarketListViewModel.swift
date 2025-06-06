//
//  MarketListViewModel.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/05/25.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func error(message: String)
}

class MarketListViewModel {
    
    private var service: CoinService = CoinService()
    private var coins: [CoinElement] = []
    private weak var delegate: HomeViewModelProtocol?
    
    func setDelegate(_ delegate: HomeViewModelProtocol?) {
        self.delegate = delegate
    }
    
    public func fetchRequest() {
        service.fetchCoins { [weak self] result in
            switch result {
            case .success(let success):
                self?.coins = success
                self?.delegate?.success()
            case .failure(let failure):
                print(failure)
                self?.delegate?.error(message: failure.localizedDescription)
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return coins.count
    }
    
    public func loadCurrentCoins(indexPath: IndexPath) -> CoinElement {
        return coins[indexPath.row]
    }
}

