//
//  NewsService.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 11/06/25.
//

import Foundation

class NewsService {
    
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        let urlString = "https://gnews.io/api/v4/search?q=crypto%20OR%20bitcoin%20OR%20ethereum&lang=en&token=4f1e504fe20e366ca53d802579cf4157"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorDetail.errorURL(urlString: urlString)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
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
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let newsFeed = try decoder.decode(NewsFeed.self, from: data)
                let articles = newsFeed.articles ?? []
                print("Success -> \(#function)")
                completion(.success(articles))
            } catch  {
                print("Error -> \(#function) : \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
