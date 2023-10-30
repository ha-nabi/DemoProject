//
//  농구공.swift
//  DemoProject
//
//  Created by 강치우 on 10/12/23.
//


import SwiftUI

struct baseballSolution: View {
    
    @State private var baseball: String = ""
    @State private var result: String = ""
    
    
    var body: some View {
        Text("상자가 몇개 필요할까?")
            .foregroundColor(.black)
            .fontWeight(.ultraLight)
            .font(.system(size: 35))
        VStack {
            VStack {
                TextField("농구공의 개수를 입력하세요", text: $baseball)
                    .border(Color.gray)
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: buttonPressed, label: {
                    Text("Send")
                        .padding()
                })
            }
            HStack {
                Image(systemName: "hand.point.down")
                    .resizable()
                    .frame(width: 30, height: 35)
                    .padding(15)
            }
            HStack {
                TextField("필요한 상자의 수", text: $result)
                    .border(Color.gray)
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
        .padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20))
        .border(Color.gray)
    }
    func buttonPressed() {
        
        let a = Int(baseball)!
        
        if a / 5 != 0 {
            result = "\(a / 5 + 1) 개"
        } else {
            result = "\(a / 5) 개"
        }
    }
}

#Preview {
    baseballSolution()
}
