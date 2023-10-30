//
//  ex1 변형.swift
//  DemoProject
//
//  Created by 강치우 on 10/19/23.
//

import SwiftUI

//동시성 예제 01
//
//1부터 100까지의 합을 구하는 비동기 함수
//async let을 사용하여 두 개의 비동기 작업을 동시에 실행하고 결과를 합하여 출력하는 함수를 작성해보세요.
//1...100 더하는 함수
//
//1...50 더하는 함수 1개 작업을 실행
//51...100 더하는 함수 1개 작어블 실행
//
//두 결과를 더해서 1...100 합한 값을 출력하세요.

struct ex1_______: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething2()
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
    
    func doSomething2() async {
        let result1 = await sumFrom(1, 50) // async let을 사용하여 두개의 비동기
        let result2 = await sumFrom(51, 100) // 작업을 동시에 실행함
        //결과 출력
        let a = result1
        let b = result2
        print("\(a + b)")
    }
    
    // s부터 b까지 합을 구하는 비동기 함수
    func sumFrom(_ s: Int, _ b: Int) async -> Int {
        var sum = 0
        for i in s...b {
            sum += i
        }
        return sum
    }
}

#Preview {
    ex1_______()
}
