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

    public func fetchRequest() {
        service.fetchNews { [weak self] result in
            switch result {
            case .success(let success):
                self?.articles = success
                self?.delegate?.success()
            case .failure(let failure):
                print(failure)
                self?.delegate?.error(message: failure.localizedDescription)
            }
        }
    }
}
