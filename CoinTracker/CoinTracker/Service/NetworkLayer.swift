//
//  NetworkLayer.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 05/08/25.
//

import Foundation

protocol NetworkLayer {
    var session: URLSession { get }
    func request<T: Decodable>(with urlString: String, method: HTTPMethod, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}
