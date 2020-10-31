//
//  ContentView.swift
//  Jobs
//
//  Created by i.smetanin on 25.10.2020.
//

import SwiftUI

struct PositionsView: View {
    enum State {
        case loading
        case error(error: Error)
        case data(positions: [Position])
    }

    @ObservedObject var viewModel = PositionsViewModel()

    var body: some View {
        switch viewModel.state {
        case .data(let positions):
            return positionsView(with: positions)
        case .loading:
            return loadingView()
        case .error(let error):
            return errorView(with: error)
        }
    }

    private func positionsView(with positions: [Position]) -> AnyView {
        AnyView(
            List {
                ForEach(positions) {
                    Text($0.id)
                }
            }
        )
    }

    private func loadingView() -> AnyView {
        AnyView(
            Text("Loading")
        )
    }

    private func errorView(with error: Error) -> AnyView {
        AnyView(
            Text("Something went wrong")
        )
    }
}

struct PositionsView_Previews: PreviewProvider {
    static var previews: some View {
        PositionsView()
    }
}
