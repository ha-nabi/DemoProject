//
//  1234.swift
//  DemoProject
//
//  Created by 강치우 on 10/12/23.
//

import SwiftUI

struct _234: View {
    
    @State private var num1: String = ""
    @State private var num2: String = ""
    @State private var result: String = ""
    
    
    var body: some View {
        
        Text("빼기도 못하냐 ? ")
            .font(.title)
        VStack {
            VStack {
                TextField("첫 번째 정수 입력", text: $num1)
                    .border(Color.gray)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                TextField("두 번째 정수 입력", text: $num2)
                    .border(Color.gray)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                Button(action: buttonPressed,
                       label: {
                    Text("Send")
                        .padding()
                })
            }
            VStack {
                Image(systemName: "hand.point.down")
                    .resizable()
                    .frame(width: 30, height: 35)
                    .padding(15)
            }
            VStack {
                TextField("결과값은?", text: $result)
                    .border(Color.gray)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
            }
            .border(Color.gray)
            .padding(5)
        }
        .padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20))
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
    func buttonPressed() {
        
        let a = Int(num1)!
        let b = Int(num2)!
        
        if a > b {
            result = "\(a-b)"
        } else {
            result = "\(b-a)"
        }
    }
}
#Preview {
    _234()
}
