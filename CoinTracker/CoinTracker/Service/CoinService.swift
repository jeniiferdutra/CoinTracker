//
//  CoinService.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/05/25.
//

import Foundation

enum ErrorDetail: Error {
    case errorURL(urlString: String)
    case detailError(detail: String)
    case requestFailed(error: Error)
    case invalidResponse
    case invalidStatusCode(code: Int)
}

class CoinService {
    
    func fetchCoins(completion: @escaping (Result<[CoinElement], Error>) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorDetail.errorURL(urlString: urlString)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                completion(.failure(ErrorDetail.detailError(detail: "Data is nil")))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(ErrorDetail.invalidResponse))
                return
            }
            
            do {
                let coins: [CoinElement] = try JSONDecoder().decode([CoinElement].self, from: data)
                print("Sucess -> \(#function)")
                completion(.success(coins))
            } catch {
                print("Error -> \(#function)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
