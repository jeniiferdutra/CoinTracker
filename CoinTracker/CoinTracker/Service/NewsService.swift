//
//  NewsService.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 11/06/25.
//

import Foundation

protocol NewsServiceDelegate: GenericService {
    func fetchNews(completion: @escaping (Result<[Article], NetworkError>) -> Void)
    func loadNewsFromLocalJSON(completion: @escaping completion<[Article]?>)
}

class NewsService: NewsServiceDelegate {
    
    func fetchNews(completion: @escaping (Result<[Article], NetworkError>) -> Void) {
        let urlString = "https://gnews.io/api/v4/search?q=crypto%20OR%20bitcoin%20OR%20ethereum&lang=en&token=4f1e504fe20e366ca53d802579cf4157"
        ServiceManager.shared.request(with: urlString, method: .get, decodeType: NewsFeed.self) { result in
            switch result {
            case .success(let feed):
                completion(.success(feed.articles ?? []))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadNewsFromLocalJSON(completion: @escaping completion<[Article]?>) {
        if let url = Bundle.main.url(forResource: "NewsData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let news: [Article] = try JSONDecoder().decode([Article].self, from: data)
                completion(news, nil)
            } catch {
                completion(nil, FileError.fileDecodingFailed(name: "NewsData", error))
            }
        } else {
            completion(nil, FileError.fileNotFound(name: "NewsData"))
        }
    }
}
