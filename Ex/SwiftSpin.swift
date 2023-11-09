//
//  UIView.swift
//  DemoProject
//
//  Created by 강치우 on 10/13/23.
//

import SwiftUI

struct SwiftSpin: View {
    
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "빙글뱅글빙글뱅글"
    
    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 3), value: rotation )
                .foregroundColor(colors[colorIndex])
            Spacer()
            Divider()
            Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding()
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach (0..<colornames.count, id: \.self) {
                    Text(colornames[$0])
                        .foregroundStyle(colors[$0])
                }
                
            }
            .pickerStyle(.wheel)
            .padding()
        }
    }
}

#Preview {
    SwiftSpin()
}
