//
//  ContentView.swift
//  example2
//
//  Created by 강치우 on 10/11/23.
//

import SwiftUI

struct ContentView: View {

    @State private var num1: String = ""
    @State private var result: String = ""
    @State private var result2: String = ""
    

    var body: some View {
        ZStack {
            Image("민지").ignoresSafeArea()
            VStack {
                Image(systemName: "clock.fill")
                    .foregroundStyle(.white)
                    .imageScale(.large)
                    .padding()
                
                Text("초 입력 안하냐 ?")
                    .foregroundColor(.black)
                    .font(.system(size: 33))

                TextField("빨리 적어라", text: $num1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                
                Button(action: buttonPressed, label: { Text("Send")})
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .border(Color.black)
                    .padding()

                
                Image(systemName: "arrowshape.down.fill")
                    .foregroundStyle(.white)
                    .imageScale(.large)
                    .padding()
                
                TextField("시간은 바로바로~", text: $result)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                
            }
            .padding(20)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
    }
    func buttonPressed() {
        let a = Int(num1)!
        
        result = "\(a / 3600)시 \(a / 60 % 60)분 \(a % 3600 % 60)초"
    }
}

#Preview {
    ContentView()
}
