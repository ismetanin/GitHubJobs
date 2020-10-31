//
//  Endpoint.swift
//  Jobs
//
//  Created by i.smetanin on 25.10.2020.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var scheme: String { get }
    var host: String { get }
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems.isEmpty ? nil : queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }

    var scheme: String {
        return "https"
    }

    var host: String {
        return "jobs.github.com"
    }
}
