//
//  MarketListViewModel.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/05/25.
//

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
            guard let self = self else { return }
            switch result {
            case .success(let coins):
                self.coins = coins
                self.delegate?.success()
            case .failure(let error):
                self.delegate?.error(message: error.localizedDescription)
            }
        }
    }
}

