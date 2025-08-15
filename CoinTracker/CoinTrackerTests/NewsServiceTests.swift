//
//  NewsServiceTests.swift
//  CoinTrackerTests
//
//  Created by Jenifer Rocha on 15/08/25.
//

import XCTest
import OHHTTPStubs
@testable import CoinTracker

final class NewsServiceTests: XCTestCase {
    
    var newsService: NewsService!

    override func setUpWithError() throws {
        newsService = NewsService()
    }

    override func tearDownWithError() throws {
        newsService = nil
    }

    func testFetchNewsSuccess() {
        
        let expectation = self.expectation(description: "fetch news")

        newsService.fetchNews { result in
            switch result {
            case .success(let success):
                XCTAssertNotNil(success, "Success nao pode ser nil")
                XCTAssertGreaterThan(success.count, 0, "A noticia nao deveria ser igual ou maior que zero")
                expectation.fulfill()
            case .failure(let failure):
                XCTFail("A request nao pode cair no caso de failure")
            }
        }
        
        waitForExpectations(timeout: 10)
    }
    
    //MARK: Teste de erro
    
    func testFetchNewsFailure() {
        
        let expectation = self.expectation(description: "fetch news failure")

        HTTPStubs.stubRequests { request in
            request.url?.absoluteString.contains("https://gnews.io/api/v4/search?q=crypto%20OR%20bitcoin%20OR%20ethereum&lang=en&token=4f1e504fe20e366ca53d802579cf4157") ?? false
        } withStubResponse: { _ in
            return HTTPStubsResponse(error: NSError(domain: "com.test.error", code: 404))
        }

        newsService.fetchNews { result in
            switch result {
            case .success(let success):
                XCTFail("A request nao pode cair no caso de success")
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10)
        HTTPStubs.removeAllStubs()
    }
}
