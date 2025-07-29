//
//  GenericService.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 28/07/25.
//

import Foundation

enum FileError: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
}

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
