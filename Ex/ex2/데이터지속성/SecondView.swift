//
//  SecondView.swift
//  DemoProject
//
//  Created by 강치우 on 10/26/23.
//

import SwiftUI

struct SecondView: View {
    @Binding var bgColor: Color
    
    var body: some View {
        VStack {
            Text("The background color you chose")
                .font(.body)
                .fontWeight(.light)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SecondView(bgColor: .constant(Color.white))
}
