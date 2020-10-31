//
//  PositionsService.swift
//  Jobs
//
//  Created by i.smetanin on 25.10.2020.
//

import Foundation
import Combine

final class PositionsService {
    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func search(
        description: String? = nil,
        location: String? = nil,
        fulltime: Bool = false
    ) -> AnyPublisher<[Position], Error> {
        let endpoint = PositionsEndpoint.search(description: description, location: location, fulltime: fulltime)
        return session.dataTaskPublisher(for: endpoint.url)
    }
}
