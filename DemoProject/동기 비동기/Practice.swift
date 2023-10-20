//
//  Practice.swift
//  DemoProject
//
//  Created by 강치우 on 10/19/23.
//

import SwiftUI

struct Practice: View {
    var body: some View {
        Button(action: {
            // 동기 함수에서 비동기 함수 호출
            Task {
                await doSomething()
            }
        }, label: {
            Text("Do Something!")
        })
    }
    //                Void
    func doSomething() async { // 먼저 출력할 함수
        //               딕셔너리 타입
        var timeStamps: [Int: Data] = [:]
        // 먼저 출력함
        print("Start \(Date())")
        // 기다리는 함수, 반환 타입 변경 : Void.self -> (Int, Data)
        await withTaskGroup(of: (Int, Data).self) { group in
            for i in 1...5 {
                group.addTask {
                    return (i, await takeTooLong())
                }
            }
            // for await 형식
            for await (task, Data) in group {
                timeStamps[task] = Data
            }
            
            // 작업 그룹이 종료된 후 저장된 timeStamps 딕셔너리 항목을 출력
            for (task, Data) in timeStamps {
                print("Task = \(task), Data = \(Data)")
            }
            
            print("End \(Data())")
        }
        
        @Sendable func takeTooLong() async -> Data {
            sleep(UInt32.random(in: 1...5)) // 1~5초 사이에 랜덤 초 지연
            return Data()
        }
    }
}
#Preview {
    Practice()
}
