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
    
    public func fetchRequest(_ typeFetch: TypeFetch) {
        
        switch typeFetch {
        case .mock:
            service.loadCoinsFromLocalJSON { result, failure in
                if let result {
                    self.coins = result
                    self.delegate?.success()
                } else {
                    self.delegate?.error(message: failure?.localizedDescription ?? "Erro desconhecido")
                }
            }
        case .request:
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
        
    }
    
    public var numberOfRowsInSection: Int {
        return coins.count
    }
    
//    public func heightForRowAt() -> CGFloat {
//        switch indexPath.row {
//            case 0:
//                return 200 // altura do header
//            case 1:
//                return 70  // altura do título "Coins"
//            default:
//                return 85  // altura da célula de moeda
//            }
//    }
    
    public func loadCurrentCoins(indexPath: IndexPath) -> CoinElement {
        return coins[indexPath.row]
    }
}

