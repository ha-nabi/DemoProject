//
//  시간구하기.swift
//  DemoProject
//
//  Created by 강치우 on 10/11/23.
//

import SwiftUI

struct 시간구하기: View {
    
    @State private var num1: String = ""
    @State private var result: String = ""
    @State private var result2: String = ""
    
    
    var body: some View {
        ZStack {
            Image("민지").ignoresSafeArea()
                .opacity(0.9)
                .blur(radius: 5)
            VStack {
                Image(systemName: "clock.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.white)
                    .padding()
                    .opacity(0.7)
                
                Text("시간을 구해봅시당")
                    .foregroundColor(.black)
                    .fontWeight(.ultraLight)
                    .font(.system(size: 35))
                
                TextField("초를 적으세용", text: $num1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 120)
                    .multilineTextAlignment(.center)
                    .opacity(0.7)
                
                Button(action: buttonPressed, label: { Text("Send")})
                    .frame(width: 50)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .border(Color.white)
                    .cornerRadius(5)
                    .padding()
                    .opacity(0.7)
                
                
                Image(systemName: "arrowshape.down.fill")
                    .resizable()
                    .frame(width: 25, height: 33)
                    .foregroundStyle(.white)
                    .padding(.bottom, 10)
                    .opacity(0.7)
                
                TextField("시간은 바로바로~", text: $result)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .opacity(0.7)
                
            }
            .padding(EdgeInsets(top: 70, leading: 20, bottom: 70, trailing: 20))
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
    }
    func buttonPressed() {
        if let t = Int(num1) {
            
            let m = (t / 60) % 60
            let h = (t / 60) / 60
            let s = t % 60
            result = "\(h) 시 \(m) 분 \(s) 초"
        } else {
            result = ""
        }
        
    }
}
#Preview {
    시간구하기()
}
