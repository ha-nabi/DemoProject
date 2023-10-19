//
//  ExButtonView.swift
//  DemoProject
//
//  Created by 강치우 on 10/16/23.
//

import SwiftUI

struct ExButtonView: View {
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Button("BUTTON") {
                }
                .frame(width: geometry.size.width)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
                
                Spacer()
                Button("BUTTON") {
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 4 * 3)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
                
                Spacer()
                Button("BUTTON") {
                }
                .frame(width: geometry.size.width)
                .padding(5)
                .foregroundColor(Color.white)
                .background(Color.indigo)
                .cornerRadius(5)
            }
        }
    }
}

#Preview {
    ExButtonView()
}
