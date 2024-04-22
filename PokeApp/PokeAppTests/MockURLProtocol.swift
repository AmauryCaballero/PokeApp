//
//  MockURLProtocol.swift
//  PokeAppTests
//
//  Created by Amaury Caballero on 21/4/24.
//

import Foundation

/// MockURLProtocol allows us to test network operations by intercepting network requests
/// and providing custom responses.
class MockURLProtocol: URLProtocol {
    /// Static property to hold data we want to return in our mock response.
    static var stubResponseData: Data?
    /// Static property to hold any error we want to return in our mock response.
    static var error: Error?

    /// This method determines whether this protocol can handle the given request.
    override class func canInit(with request: URLRequest) -> Bool {
        return true // Handle all types of requests
    }

    /// Returns a canonical version of the request but not needed for simple testing.
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    /// Starts loading the request. We respond with stubbed data or an error.
    override func startLoading() {
        if let error = MockURLProtocol.error {
            client?.urlProtocol(self, didFailWithError: error)
        } else if let data = MockURLProtocol.stubResponseData {
            client?.urlProtocol(self, didLoad: data)
        }
        client?.urlProtocolDidFinishLoading(self)
    }

    /// Stops loading the request. This function is required but doesn't need to do anything.
    override func stopLoading() {
        // Normally you'd cancel the request here, but for testing, we do nothing.
    }
}
