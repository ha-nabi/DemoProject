//
//  abcd2.swift
//  DemoProject
//
//  Created by 강치우 on 10/30/23.
//

import SwiftUI

struct abcd2: View {
    @State private var icup = "square.and.arrow.up"
    @State private var icdown = "square.and.arrow.down"
    
    var body: some View {
        VStack {
            Image(systemName: icup)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            Spacer()
            
            HStack {
                Spacer()
                Button("UP") {
                    // 위치 바꾸기
                    if icup.hasSuffix("down") {(icup,icdown) = (icdown, icup)}
                }
                .lionButtonModifier()
                Spacer()
                Button("Down") {
                    if icup.hasSuffix("up") {(icup,icdown) = (icdown, icup)}
                }
                .lionButtonModifier()
                Spacer()
            }
            Spacer()
            Image(systemName: icdown)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
        }
    }
}
#Preview {
    abcd2()
}
