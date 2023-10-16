//
//  ContentView.swift
//  example
//
//  Created by 강치우 on 10/11/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        NavigationView {

            VStack {
                Image(systemName: "pencil.and.scribble")
                Text("Hello, world!")
                Button(action: btnPressed(), label: {
                })

                NavigationLink(destination: BasicView, label: {
                        Text("Next View")
                            .font(.largeTitle)}
                )
            }
            .padding(100)
            .background(Color.teal)
        }
    }

}
           
#Preview {
    ContentView()
}
