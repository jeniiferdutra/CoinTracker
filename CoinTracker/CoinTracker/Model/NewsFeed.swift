//
//  NewsFeed.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 11/06/25.
//

import Foundation

// MARK: - NewsFeed
struct NewsFeed: Codable {
    var totalArticles: Int?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    var title, description, content: String?
    var url: String?
    var image: String?
    var publishedAt: Date?
    var source: Source?
}

// MARK: - Source
struct Source: Codable {
    var name: String?
    var url: String?
}
