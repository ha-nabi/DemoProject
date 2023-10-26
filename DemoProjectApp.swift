//
//  DemoProjectApp.swift
//  DemoProject
//
//  Created by 강치우 on 10/10/23.
//

import SwiftUI

@main
struct DemoProjectApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {		
            SwiftUIView()
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("Active")
            case .inactive:
                print("Inactive")
            case .background:
                print("background")
            default:
                print("Unknown scenephase")
            }
        }
    }
}
