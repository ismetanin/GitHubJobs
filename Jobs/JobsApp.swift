//
//  JobsApp.swift
//  Jobs
//
//  Created by i.smetanin on 25.10.2020.
//

import SwiftUI

@main
struct JobsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                PositionsView()
            }
        }
    }

    init() {
        applyNavigationAppearance()
    }

    private func applyNavigationAppearance() {
        let standard = UINavigationBarAppearance()
        standard.configureWithTransparentBackground()
        standard.backgroundColor = .white
        standard.titleTextAttributes = [.foregroundColor: UIColor.black]
        standard.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        let scrollEdge = standard.copy()
        scrollEdge.backgroundColor = Color.mainBackground.uiColor

        UINavigationBar.appearance().standardAppearance = standard
        UINavigationBar.appearance().compactAppearance = standard
        UINavigationBar.appearance().scrollEdgeAppearance = scrollEdge
        UINavigationBar.appearance().tintColor = .blue
    }
}
