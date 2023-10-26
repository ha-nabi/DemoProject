//
//  SwiftUIView.swift
//  DemoProject
//
//  Created by 강치우 on 10/26/23.
//

import SwiftUI

// ContentView
struct LifecycleDemoView: View {
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem {
                    Image(systemName: "01.circle")
                    Text("First")
                }
            SecondTabView()
                .tabItem {
                    Image(systemName: "02.circle")
                    Text("Second")
                }
        }
    }
}

#Preview {
    LifecycleDemoView()
}
