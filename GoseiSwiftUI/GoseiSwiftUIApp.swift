//
//  GoseiSwiftUIApp.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI
import Fusion

@main
struct GoseiSwiftUIApp: App {
    
    init() {
        Container.bind(.singleton, to: PersistenceServiceProtocol.self, value: PersistenceService())
//        Font.printFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                RootView()
                    .navigationBarHidden(true)
                    .navigationTitle("")
            }
        }
    }
}
