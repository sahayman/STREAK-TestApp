//
//  STREAK_TestAppApp.swift
//  STREAK+TestApp
//
//  Created by Steve Hayman on 2023-05-26.
//

import SwiftUI

@main
struct STREAK_TestAppApp: App {
    var body: some Scene {
        @AppStorage("selectedTab") var selectedTab = "Airports"
        WindowGroup {
            TabView(selection: $selectedTab) {
                Airports()
                    .tabItem {
                        Label("Airports", systemImage:"airplane.circle")
                    }
                    .tag("Airports")
                
                Sounds()
                    .tabItem {
                        Label("Sounds", systemImage:"speaker")
                    }
                    .tag("Sounds")
            }
        }
    }
}
