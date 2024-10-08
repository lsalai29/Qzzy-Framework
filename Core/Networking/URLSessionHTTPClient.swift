//
//  URLSessionHTTPClient.swift
//  Core
//
//  Created by Lana Salai on 8.10.24..
//

import Foundation

public final class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    public func perform(request: URLRequest, completion: @escaping (HTTPClient.Result) -> Void) {
        session.dataTask(with: request) { data, response, error in
            completion(.failure(NSError(domain: "any error", code: 1)))
        }.resume()
    }
}
