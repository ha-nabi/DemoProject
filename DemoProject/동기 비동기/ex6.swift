//
//  ex6.swift
//  DemoProject
//
//  Created by 강치우 on 10/20/23.
//

//동시성 예제 06
//
//다음 코드는 비동기 함수를 호출하고, 그 결과를 동기적으로 반환하는 함수입니다.
//하지만 이 코드는 런타임 에러가 발생합니다.
//에러의 원인과 해결 방법을 설명하고, 올바른 코드를 작성해보세요.

//func asyncDouble(_ x: Int) async -> Int {
//    return x * 2
//}
//
//func syncDouble(_ x: Int) -> Int {
//    return await asyncDouble(x)
//}

import SwiftUI

struct ex6: View {
    var body: some View {
        Button {
            Task {
                await syncDouble(_: 5)
            }
        } label: {
            Text("Ex6")
        }
    }
    
    func syncDouble(_ x: Int) async -> Int {
        let a = await asyncDouble(x)
        return a
        print("\(a)")
    }
    
    func asyncDouble(_ x: Int) async -> Int {
        return x * 2
    }
}

#Preview {
    ex6()
}
