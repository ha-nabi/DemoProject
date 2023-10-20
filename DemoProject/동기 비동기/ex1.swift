//
//  ex1.swift
//  DemoProject
//
//  Created by 강치우 on 10/19/23.
//

import SwiftUI

struct ex1: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }, label: {
            Text("내가만든쿼키")
        })
    }
    
    // 비동기 함수를 출력할 동기 함수
    func doSomething() async {
        async let result1 = sumFrom(1, 50) // async let을 사용하여 두개의 비동기
        async let result2 = sumFrom(51, 100) // 작업을 동시에 실행함
        //결과 출력
        let a = await result1
        let b = await result2
        print("\(a + b)")
    }
    
    // s부터 b까지 합을 구하는 비동기 함수
    func sumFrom(_ s: Int,_ e: Int) async -> Int {
        var sum = 0
        for i in s...e {
            sum += i
        }
        return sum
    }
}

#Preview {
    ex1()
}
