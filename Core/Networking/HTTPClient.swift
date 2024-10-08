//
//  HTTPClient.swift
//  Core
//
//  Created by Lana Salai on 8.10.24..
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    func perform(request: URLRequest, completion: @escaping (Result) -> Void)
}

//TODO: check this
public extension HTTPClient {
    func perform(request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            perform(request: request) { result in
                continuation.resume(with: result)
            }
        }
    }
}
