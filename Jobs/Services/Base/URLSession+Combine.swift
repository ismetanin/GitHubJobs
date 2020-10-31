//
//  URLSession+Combine.swift
//  Jobs
//
//  Created by i.smetanin on 25.10.2020.
//

import Foundation
import Combine

extension URLSession {
    func dataTaskPublisher<Output: Decodable>(for url: URL) -> AnyPublisher<Output, Error> {
        return dataTaskPublisher(for: URLRequest(url: url))
    }

    func dataTaskPublisher<Output: Decodable>(for request: URLRequest) -> AnyPublisher<Output, Error> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return self
            .dataTaskPublisher(for: request)
            .map ({ data, response in
                print(response)
                return data
            })
            .decode(type: Output.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
