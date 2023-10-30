//
//  SwiftUIView.swift
//  DemoProject
//
//  Created by 강치우 on 10/19/23.
//


/**
 # 스위프트 구조화된 동시성
 
 동시성
 - 여러 작업을 병렬로 수행하는 소프트웨어 기능
 - Swift는 구조화된 방식으로 비동기와 병렬 코드 작성을 지원
 - 비동기 코드는 일시적으로 중단되었다가 다시 실행할 수 있지만 한번에 프로그램의 한
 부분만 실행
 - 병렬 코드는 동시에 여러 부분이 실행됨을 의미
 - 동시성 이라는 용어를 사용하여 비동기와 병렬 코드의 일반적인 조합을 나타냄
 
 스레드(thread)
 - 메인 프로세스 내에서 실행되는 미니 프로세스로 생각할 수 있으며, 그 목적은 애플리케이션
 코드 내에서 병렬 실행의 형태를 가능하게 하는 것
 - Swift 에서 동시성 모델은 쓰레드의 최상단에 구축되지만 직접적으로 상호작용할 필요는
 없음(구조화된 동시성이 모든 복잡성을 처리)
 
 애플리케이션 메인 스레드
 - 앱이 시작될 때 기본적으로 실행되는 단일 스레드
 - 주요 역할 : UI 렌더링, 이벤트 처리 및 사용자 인터페이스에서 부와 사용자
 상호작용 측면에서 사용자 인터페이스를 처리
 
 비동기 함수 정의와 호출 (async/await
 - 함수 파라미터 뒤의 선언에 async 키워드를 작성
 - 함수 또는 메서드가 값을 반환한다면 반환 화살표 (->) 전에
 - await 를 사용하여 결과를 사용할 수 있을 때까지 실행이 중지
 
 ## 작업과 작업 그룹 (Tasks and Task Groups)
 
 작업(task) 은 프로그램의 일부로 비동기적으로 실행할 수 있는 작업 단위
 - 모든 비동기 코드는 어떠한 작업의 일부로 실행
 - 작업은 계층 구조로 정렬이 가능
 - 작업 그룹 (task group) 을 생성하고 해당 그룹에 하위 작업을 추가 가능
 - 작업과 작업 그룹 간의 며시적 관계 때문에 이 접근 방식을 구조적 동시성 또는 구조화된 동시성
 
 ## 구조화되지 않은 동시성 ( Unstructured Concurrency )
 - 작업 그룹의 일부인 작업과 달리 구조화되지 않은 작업에는 상위 작업이 없음
 - 프로그램이 필요로 하는 방식으로 구조화되지 않은 작업을 관리할 수 있는 완전한 유연한 유연성이 있지만
 정확성에 대한 책임도 있음
 - 구조화 되지 않는 작업을 생성하려면 Task.init(priority: operation:) 초기화 구분을 호출
 - 분리된 작업으로 알려진 현재 액터의 일부가 아닌 구조화 되지 않은 작업을 생성하려면 Task.detached(priority: operation:) 메서드를 호출
 
 
 */

import SwiftUI


struct ConcurrencyView: View {
    var body: some View {
        Button(action: {
            // 동기 함수에서 비동기 함수 호출
            Task {
                await doSomething()
            }
        }, label: {
            Text("Do Something")
        })
    }

    // 작업 그룹
    // 동적인 조건에 따라 여러 작업을 동시에 생성하고 실행해야 하는 상황
    // withTaskGroup() 함수 이용
    // addTask() 함수를 호출하여 각각의 새롱누 작업을 추가
    // cancelAll() 그룹의 모둔 작업을 취소하는 메서드
    // isCancelled 작업 그룹이 이미 취소되었는지 여부를 확인하는 속성
    // isEmpty 작업 그룹 내에 작업이 남아 있는지 여부를 확인하는 속성
    // 데이터 경쟁 피하기
    // 동시에 데이터에 접근하는 여러 작업은 데이터 경쟁(Data race) 조건이 발생할 위험이 있음
    // 여러 작업이 동시에 동일한 데이터에 접근하려고 시도하면 데이터 오류가 발생
    func doSomething() async {
        var timeStamps: [Int: Date] = [:]
        
        print("Start \(Date())")
        
        // 반환 타입을 변경 : Void.self -> (Int, Date)
        await withTaskGroup(of: (Int, Date).self) { group in
            for i in 1...5 {
                group.addTask {
                    return (i, await takeTooLong())
                }
            }
            
            // for-await 표현식을 사용하여 비동기적으로 반환되는 일련의 값을 루프
            // 동시 작업에서 반환되는 값의 수신을 기다려서 처리
            // 일련의 데이터가 AsyncSequence 프로토콜 준수가 필수 요구사항
            for await (task, date) in group {
                timeStamps[task] = date
            }
            
            // 작업 그룹이 종료된 후 저장된 timeStamps 딕셔너리 항목을 출력
            for (task, date) in timeStamps {
                print("Task = \(task), Date = \(date)")
            }
        }
        print("End \(Date())")
    }

    func takeTooLong() async -> Date {
        sleep( UInt32.random(in: 1...5) )            // 랜덤 초 지연
        return Date()
    }
}

// async-let 바인딩
// 비동기 함수를 호출하고 주변의 코드와 병렬로 실행하려면 (동시실행)
// 상수를 정의할 때 let 앞에 async 를 작성하고, 상수를 사용할 때마다 await 를 작성
// takeTooLong() 함수가 실행되는 동안 버튼 클릭이 가능

func doSomething() async {
    print("Start \(Date())")
    async let result1 = takeTooLong()
    async let result2 = takeTooLong()
    async let result3 = takeTooLong()
    print("After async-let \(Date())")
    for i in 1...5 { print(i) }
    
    print("result1 End \(await result1)")
    print("result2 End \(await result2)")
    print("result3 End \(await result3)")
    // 비동기 함수와 동시에 실행할 추가 코드
    for i in 6...10 { print(i) }
    
}

func takeTooLong() async -> Date {
    sleep(UInt32.random(in: 1...5))            // 램덤 초 지연
    return Date()
}


/*
 비동기 함수 선언 async
 비동기 함수 호출 await
 takeTooLong() 함수가 실행되는 동안 버튼 클릭이 가능
 func doSomething() async {
 print("Start \(Date())")
 await takeTooLong()
 print("End \(Date())")
 }
 
 func takeTooLong() async {
 sleep(5)            // 5초 지연
 print("Async task completed at \(Date())")
 }
 */


/*
 동기 코드 p.232-233
 takeTooLong() 함수가 실행되는 동안 아무 것도 할 수 없음
 func doSomething() {
 print("Start \(Date())")
 takeTooLong()
 print("End \(Date())")
 }
 
 func takeTooLong() {
 sleep(5)            // 5초 지연
 print("Async task completed at \(Date())")
 }
 
 }
 
 #Preview {
 ConcurrencyView()
 }*/
