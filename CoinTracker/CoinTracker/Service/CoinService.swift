//
//  CoinService.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/05/25.
//

import Foundation

protocol CoinServiceDelegate: GenericService {
    func fetchCoins(completion: @escaping (Result<[CoinElement], NetworkError>) -> Void)
    func loadCoinsFromLocalJSON(completion: @escaping completion<[CoinElement]?>)
}

class CoinService: CoinServiceDelegate {
    
    func fetchCoins(completion: @escaping (Result<[CoinElement], NetworkError>) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
        ServiceManager.shared.request(with: urlString, method: .get, decodeType: [CoinElement].self) { result in
            switch result {
            case .success(let coins):
                completion(.success(coins))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadCoinsFromLocalJSON(completion: @escaping completion<[CoinElement]?>) {
        if let url = Bundle.main.url(forResource: "CoinData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let coinList: [CoinElement] = try JSONDecoder().decode([CoinElement].self, from: data)
                completion(coinList, nil)
            } catch {
                completion(nil, FileError.fileDecodingFailed(name: "CoinData", error))
            }
        } else {
            completion(nil, FileError.fileNotFound(name: "CoinData"))
        }
    }
}
