//
//  GreedView.swift
//  DemoProject
//
//  Created by 강치우 on 10/16/23.
//

import SwiftUI

struct ClassExampleView: View {
    
    let column: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: column){
            Text("Hell-o?")
                .background(Color.mint)
            Text("Hell-o?")
                .background(Color.blue)
            Text("Hell-o?")
                .background(Color.red)
            
            Text("Hell-o?")
                .background(Color.mint)
            Text("Hell-o?")
                .background(Color.blue)
            Text("Hell-o?")
                .background(Color.red)
        }
    }
}

#Preview {
    ClassExampleView()
}
