//
//  PositionsEndpoint.swift
//  Jobs
//
//  Created by i.smetanin on 25.10.2020.
//

import Foundation

enum PositionsEndpoint: Endpoint {
    case search(description: String? = nil, location: String? = nil, fulltime: Bool = false)
    case details(id: String, markdown: Bool)

    // MARK: - Endpoint

    var path: String {
        switch self {
        case .search:
            return "/positions.json"
        case .details(let id, _):
            return "/positions/\(id).json"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .search:
            return []
        case .details:
            return []
        }
    }
}
