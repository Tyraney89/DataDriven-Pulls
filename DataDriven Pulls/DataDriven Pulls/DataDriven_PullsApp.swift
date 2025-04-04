//
//  DataDriven_PullsApp.swift
//  DataDriven Pulls
//
//  Created by Tyler Burke on 12/22/24.
//

import SwiftUI

@main
struct DataDriven_PullsApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: [Pull.self, Hook.self],
                        isAutosaveEnabled: true)
    }
}
