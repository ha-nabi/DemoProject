//
//  ex4.swift
//  DemoProject
//
//  Created by 강치우 on 10/20/23.
//


//동시성 예제 04
//
//다음 코드는 두 개의 비동기 함수를 호출하고, 그 결과를 더해서 출력하는 코드입니다.
//하지만 이 코드는 컴파일 에러가 발생합니다.
//에러의 원인과 해결 방법을 설명하고, 올바른 코드를 작성해보세요.

//func asyncAdd(_ x: Int, _ y: Int) async -> Int {
//    return x + y
//}
//
//func asyncPrintSum(_ a: Int, _ b: Int) {
//    let sum = await asyncAdd(a, b)
//    print(sum)
//}

import SwiftUI

struct ex4: View {
    var body: some View {
        Button {
            Task {
                await asyncPrintSum(3, 5)
            }
        } label: {
            Text("Ex4")
        }
    }
    
    func asyncPrintSum(_ a: Int, _ b: Int) async { // async 추가
        let sum = await asyncAdd(a, b)
        print(sum)
    }
    
    func asyncAdd(_ x: Int, _ y: Int) async -> Int { //async 추가
        return x + y
    }
}

#Preview {
    ex4()
}
