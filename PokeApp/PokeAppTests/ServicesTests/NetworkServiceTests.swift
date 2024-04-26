//
//  NetworkServiceTests.swift
//  PokeAppTests
//
//  Created by Amaury Caballero on 21/4/24.
//

import XCTest
@testable import PokeApp
import Combine
import Alamofire


class NetworkServiceTests: XCTestCase {
    var networkService: NetworkService!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockURLProtocol.self] + (configuration.protocolClasses ?? [])
        let session = Session(configuration: configuration)
        networkService = NetworkService(session: session, cache: CacheManager())
    }
    
    override func tearDown() {
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchPokemonListSuccess() {
        let jsonData = """
        {
            "count": 1154,
            "next": "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20",
            "previous": null,
            "results": [
                {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"}
            ]
        }
        """.data(using: .utf8)!
        MockURLProtocol.stubResponseData = jsonData
        
        let expectation = self.expectation(description: "Fetch Pokemon List succeeds")
        networkService.fetchPokemonList(limit: 20, offset: 0)
            .sink(receiveCompletion: { _ in }, receiveValue: { response in
                XCTAssertEqual(response.results.first?.name, "bulbasaur")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchPokemonListFailure() {
        let error = NSError(domain: "NetworkError", code: 404, userInfo: nil)
        MockURLProtocol.error = error
        
        let expectation = self.expectation(description: "Fetch Pokemon List fails")
        networkService.fetchPokemonList(limit: 20, offset: 0)
            .sink(receiveCompletion: { completion in
                if case let .failure(receivedError) = completion {
                    if let afError = receivedError.asAFError {
                        switch afError {
                        case .sessionTaskFailed(error: let sessionError):
                            // If the AFError case is sessionTaskFailed, then compare the underlying NSError codes
                            XCTAssertEqual((sessionError as NSError).code, error.code)
                        default:
                            XCTFail("Received unexpected AFError case: \(afError)")
                        }
                    }  else {
                        XCTFail("Received an error that's not an AFError: \(receivedError)")
                    }
                    
                    expectation.fulfill()
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchPokemonDetailsSuccess() {
        let jsonData = """
        {
            "id": 1,
            "name": "blastoise",
            "base_experience": 64,
            "height": 7,
            "is_default": true,
            "order": 12,
            "weight": 855,
            "abilities": [
                {
                    "is_hidden": false,
                    "slot": 1,
                    "ability": {"name": "overgrow", "url": "https://pokeapi.co/api/v2/ability/65/"}
                }
            ]
        }
        """.data(using: .utf8)!
        MockURLProtocol.stubResponseData = jsonData
        
        let expectation = self.expectation(description: "Fetch Pokemon Details succeeds")
        networkService.fetchPokemonDetails(id: 9)
            .sink(receiveCompletion: { _ in}, receiveValue: { detail in
                XCTAssertEqual(detail.name, "blastoise")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testFetchPokemonDetailsFailure() {
        let error = NSError(domain: "NetworkError", code: 500, userInfo: nil)
        MockURLProtocol.error = error
        
        let expectation = self.expectation(description: "Fetch Pokemon Details fails")
        networkService.fetchPokemonDetails(id: 25)
            .sink(receiveCompletion: { completion in
                if case let .failure(receivedError) = completion {
                    if let afError = receivedError.asAFError {
                        switch afError {
                        case .sessionTaskFailed(error: let sessionError):
                            // If the AFError case is sessionTaskFailed, then compare the underlying NSError codes
                            XCTAssertEqual((sessionError as NSError).code, error.code)
                        default:
                            XCTFail("Received unexpected AFError case: \(afError)")
                        }
                    }  else {
                        XCTFail("Received an error that's not an AFError: \(receivedError)")
                    }
                    
                    expectation.fulfill()
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSearchPokemonByNameSuccess() {
        let jsonData = """
        {
            "count": 1,
            "next": null,
            "previous": null,
            "results": [
                {"name": "pikachu", "url": "https://pokeapi.co/api/v2/pokemon/pikachu/"}
            ]
        }
        """.data(using: .utf8)!
        MockURLProtocol.stubResponseData = jsonData
        
        let expectation = self.expectation(description: "Search Pokemon by Name succeeds")
        networkService.searchPokemonByName(name: "pikachu")
            .sink(receiveCompletion: { _ in }, receiveValue: { response in
                XCTAssertEqual(response.results.first?.name, "pikachu")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSearchPokemonByNameFailure() {
        let error = NSError(domain: "NetworkError", code: 404, userInfo: nil)
        MockURLProtocol.error = error
        
        let expectation = self.expectation(description: "Search Pokemon by Name fails")
        networkService.searchPokemonByName(name: "pikachu")
            .sink(receiveCompletion: { completion in
                if case let .failure(receivedError) = completion {
                    // Check if the receivedError is an AFError
                    if let afError = receivedError.asAFError {
                        switch afError {
                        case .sessionTaskFailed(error: let sessionError):
                            // If the AFError case is sessionTaskFailed, then compare the underlying NSError codes
                            XCTAssertEqual((sessionError as NSError).code, error.code)
                        default:
                            XCTFail("Received unexpected AFError case: \(afError)")
                        }
                    } else {
                        XCTFail("Received an error that's not an AFError: \(receivedError)")
                    }
                    expectation.fulfill()
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
}
