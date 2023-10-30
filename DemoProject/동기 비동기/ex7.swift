//
//  ex7.swift
//  DemoProject
//
//  Created by 강치우 on 10/20/23.
//

//동시성 예제 07
//
//다음 코드는 두 개의 비동기 함수를 호출하고, 그 결과를 더해서 출력하는 코드입니다.
//하지만, 이 코드는 오류가 발생합니다.
//왜 그런지 설명하고, 오류를 수정한 코드를 작성하세요.

//func asyncAdd(_ x: Int, _ y: Int) async -> Int {
//    return x + y
//}
//
//func asyncPrintSum() {
//    let a = await asyncAdd(10, 20)
//    let b = await asyncAdd(30, 40)
//    print(a + b)
//}
//
//asyncPrintSum()

import SwiftUI

struct ex7: View {
    var body: some View {
        Button {
            Task {
                await asyncPrintSum()
            }
        } label: {
            Text("Ex7")
        }
    }
    
    func asyncPrintSum() async { // async 추가
        let a = await asyncAdd(10, 20)
        let b = await asyncAdd(30, 40)
        print(a + b)
    }
    
    func asyncAdd(_ x: Int, _ y: Int) async -> Int {
        return x + y
    }
}

#Preview {
    ex7()
}
