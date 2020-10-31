//
//  PositionsViewModel.swift
//  Jobs
//
//  Created by i.smetanin on 31.10.2020.
//

import Combine
import Foundation

final class PositionsViewModel: ObservableObject {
    @Published var state: PositionsView.State = .loading

    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        PositionsService(session: .shared)
            .search()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.state = .error(error: error)
                }
            }, receiveValue: { [weak self] in
                self?.state = .data(positions: $0)
            })
            .store(in: &cancellableSet)
    }

    deinit {
        cancellableSet.forEach { $0.cancel() }
    }
}
