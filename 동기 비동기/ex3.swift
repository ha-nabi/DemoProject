//
//  SwiftUIView.swift
//  DemoProject
//
//  Created by 강치우 on 10/20/23.
//


//동시성 예제 03
//
//비동기 함수를 호출하고 결과를 출력하는 코드를 작성해보세요.

// 예시코드:
//func asyncFunction() async -> Int {
//    let random = Int.random(in: 1...10)
//    return random
//}

import SwiftUI

struct ex3: View {
    var body: some View {
        Button {
            Task {
                await doSomething()
            }
        } label: {
            Text("Button")
        }
    }
    func doSomething() async {
        async let result = asyncFunction()
        let a = await result
        print("\(a)")
    }
    
    
    // 예시코드:
    func asyncFunction() async -> Int {
        let random = Int.random(in: 1...10)
        return random
    }
}

#Preview {
    ex3()
}
