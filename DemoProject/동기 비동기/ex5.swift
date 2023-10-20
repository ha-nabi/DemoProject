//
//  ex5.swift
//  DemoProject
//
//  Created by 강치우 on 10/20/23.
//

//동시성 예제 05
//
//다음 코드는 비동기 함수 fetchUser(id:)를 호출하고, 그 결과를 print하는 코드입니다.
//이 코드에 에러가 있는지, 있다면 어디에 있는지 찾아보고, 없다면 출력 결과를 예상해보세요.

//func fetchUser(id: Int) async -> String {
//    // some network request
//    return "User \(id)"
//}
//
//func printUser(id: Int) {
//    let user = await fetchUser(id: id)
//    print(user)
//}

import SwiftUI

struct ex5: View {
    var body: some View {
        Button {
            Task {
                await printUser(id: 1004)
            }
        } label: {
            Text("Ex5")
        }
    }
    
    func printUser(id: Int) async { // async 추가
        let user = await fetchUser(id: id)
        print(user)
    }
    
    func fetchUser(id: Int) async -> String {
        // some network request
        return "User \(id)"
    }
}

#Preview {
    ex5()
}
