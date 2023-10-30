//
//  SwiftUIView.swift
//  DemoProject
//
//  Created by 강치우 on 10/11/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView(content: {
            List {
                Section("2023년 10월 10일") {
                    NavigationLink(destination: calculator()) { Text("계산기") }
                }
                Section("2023년 10월 11일") {
                    NavigationLink(destination: 시간구하기()) { Text("시간계산기") }
                }
                Section("2023년 10월 11일") {
                    NavigationLink(destination: _234()) { Text("큰 수에서 작은 수를 뺀 결과값") }
                    NavigationLink(destination: baseballSolution()) { Text("농구공을 담기 위해 필요한 상자의 개수") }
                }
                Section("2023년 10월 11일") {
                    NavigationLink(destination: SwiftSpin()) { Text("텍스트 회전") }
                }
                Section("2023년 10월 19일") {
                    NavigationLink(destination: ConcurrencyView()) { Text("동기 비동기") }
                }
                Section("2023년 10월 26일") {
                    NavigationLink(destination: ObservableDemoView()) { Text("ObservableDemoView") }
                }
                Section("2023년 10월 27일") {
                    NavigationLink(destination: StorageDemoView()) { Text("StorageDemoView") }
                    NavigationLink(destination: firstView()) { Text("배경색 고르기") }
                }
                Section("2023년 10월 30일") {
                    NavigationLink(destination: AppStorage1()) { Text("데이터지속성") }
                    NavigationLink(destination: abcd()) { Text("스택예제1") }
                }
            }
            .navigationTitle("Example")
        })
    }
}

#Preview {
    SwiftUIView()
}
