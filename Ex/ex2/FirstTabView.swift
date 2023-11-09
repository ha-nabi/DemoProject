//
//  FirstTabView.swift
//  DemoProject
//
//  Created by 강치우 on 10/26/23.
//

import SwiftUI

struct FirstTabView: View {
    @State var title = "View One"
    @State var isTitleView = false
    var body: some View {
        Text("View One")
            .onAppear(perform: {
                print("onAppear triggered")
            })
            .onDisappear(perform: {
                print("onDisappeared triggered")
            })
            .task(priority: TaskPriority.background) {
                sleep(5)
                    title = await changeTitle()
                    isTitleView = await enableTitleView()
            }
        
        if isTitleView {
            Text("금요일 같은 목요일??")
                .font(.largeTitle)
        }
    }
    
    func enableTitleView() async -> Bool {
        sleep(5)
        return true
    }
    func changeTitle() async -> String {
        sleep(5)
        return "비동기 처리 완료"
    }
}

#Preview {
    FirstTabView()
}
