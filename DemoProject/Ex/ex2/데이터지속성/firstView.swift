//
//  ex1.swift
//  DemoProject
//
//  Created by 강치우 on 10/26/23.
//

import SwiftUI

struct firstView: View {
    @State var bgColor = Color.white
    
    var body: some View {
        NavigationView {
            VStack {
                ColorPicker("Pick a background color", selection: $bgColor)
                NavigationLink(destination: SecondView(bgColor: $bgColor)) { Text("Next Page") }
                    .padding()
            }
            .padding(80)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(bgColor)
                    .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    firstView()
}
