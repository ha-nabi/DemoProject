//
//  GridView_!.swift
//  DemoProject
//
//  Created by 강치우 on 11/8/23.
//

import SwiftUI

struct GridView_1: View {
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
            ForEach(0..<16, id: \.self) { index in
                Text("Cell \(index)")
                    .frame(width: 50, height: 50)
                    .border(Color.black)
            }
        }
    }
}

#Preview {
    GridView_1()
}
