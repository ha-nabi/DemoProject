//
//  StorageDemoView.swift
//  DemoProject
//
//  Created by 강치우 on 10/26/23.
//

/**
  # AppStorage와 SceneStorage를 사용한 SwiftUI 데이터 지속성
 
 사용자의 기본 설정이나 마지막에 접근했을 때의 상태로 화면을 복구할 때 유용
 - @AppStorage: 앱 저장소, 앱 전체를 통하여 접근하고 사용할 수 있는 데이터를 저장
 - @SceneStorage: 화면 저장소, 앱 내의 각 화면마다 저장된 데이터의 복사본을 유지
    - 앱 내의 다른 화면 (동일한 화면에 대한 다른 인스턴스) 에서 접근이 안됨
 */
import SwiftUI

struct StorageDemoView: View {
    var body: some View {
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
}

#Preview {
    StorageDemoView()
}
