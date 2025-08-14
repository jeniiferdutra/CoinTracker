//
//  NewsViewModel.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 11/06/25.
//

import Foundation

protocol NewsViewModelProtocol: AnyObject {
    func success()
    func error(message: String)
}

class NewsViewModel {
    
    private var service: NewsService = NewsService()
    private var articles: [Article] = []
    private weak var delegate: NewsViewModelProtocol?
    
    func setDelegate(delegate: NewsViewModelProtocol?) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            service.loadNewsFromLocalJSON { result, failure in
                if let result {
                    self.articles = result
                    self.delegate?.success()
                } else {
                    self.delegate?.error(message: failure?.localizedDescription ?? "Erro desconhecido")
                }
            }
        case .request:
            service.fetchNews { result in
                switch result {
                case .success(let success):
                    self.articles = success
                    self.delegate?.success()
                case .failure(let failure):
                    print(failure)
                    self.delegate?.error(message: failure.localizedDescription)
                }
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return articles.count
    }
    
    public func loadCurrentCoins(indexPath: IndexPath) -> Article {
        return articles[indexPath.row]
    }
}

