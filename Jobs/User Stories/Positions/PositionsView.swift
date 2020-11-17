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

    @ObservedObject var viewModel: PositionsViewModel

    init(viewModel: PositionsViewModel = PositionsViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Color.mainBackground.ignoresSafeArea()
            content
                .navigationBarTitle("Positions")
        }
        .edgesIgnoringSafeArea(.vertical)
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .data(let positions):
            positionsView(with: positions)
        case .loading:
            loadingView
        case .error(let error):
            errorView(with: error)
        }
    }

    @ViewBuilder
    private func positionsView(with positions: [Position]) -> some View {
        AnyView(
            List {
                ForEach(positions) {
                    positionView(with: $0)
                }
                .listRowBackground(Color.contrastBackground)
            }
            .listStyle(PlainListStyle())
        )
    }

    @ViewBuilder
    private func positionView(with position: Position) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center) {
                Text(position.title)
                    .font(.system(.body))
                    .fontWeight(.medium)
                    .foregroundColor(Color.accent)
                    .multilineTextAlignment(.leading)
                Spacer()
                Text(position.location)
                    .font(.system(.footnote))
                    .foregroundColor(Color.text)
                    .multilineTextAlignment(.trailing)
            }

            HStack(alignment: .bottom) {
                Text(position.company + " – ")
                    .font(.system(.footnote))
                    .fontWeight(.light)
                Text(position.type)
                    .font(.system(.footnote))
                    .fontWeight(.medium)
            }
        }
    }

    @ViewBuilder
    private var loadingView: some View {
        AnyView(
            Text("Loading...")
        )
    }

    @ViewBuilder
    private func errorView(with error: Error) -> some View {
        AnyView(
            Text("Something went wrong")
        )
    }
}

struct PositionsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PositionsViewModel()
        viewModel.state = .data(
            positions: [
                Position.random,
                Position.random,
                Position.random
            ]
        )
        return PositionsView(viewModel: viewModel)
    }
}

private extension Position {
    static var random: Position {
        return Position(
            id: String(Int.random(in: 0...999999999)),
            type: String(Int.random(in: 0...999999999)),
            url: String(Int.random(in: 0...999999999)),
            company: String(Int.random(in: 0...999999999)),
            location: String(Int.random(in: 0...999999999)),
            description: String(Int.random(in: 0...999999999)),
            title: String(Int.random(in: 0...999999999))
        )
    }
}
