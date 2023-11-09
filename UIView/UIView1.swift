//
//  UIView1.swift
//  AlignmentTool
//
//  Created by 강치우 on 11/1/23.
//

//SwiftUI List 예제 01

//List 를 사용하여 다음과 같은 화면을 구현해보세요.
//화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
//List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트가 있습니다.
//List 의 배경색은 흰색이고, 텍스트의 색은 파란색입니다.

// 예시코드:
import SwiftUI

struct UIView1: View {
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        NavigationStack {
            List {
                ForEach(1...10, id: \.self) { item in
                    Text("item \(item)")
                        .foregroundStyle(.blue)
                }
            }
        }
    }
}

#Preview {
    UIView1()
}
