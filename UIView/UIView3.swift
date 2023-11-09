//
//  UIView3.swift
//  AlignmentTool
//
//  Created by 강치우 on 11/1/23.
//

// SwiftUI List 예제 03

//List 를 사용하여 다음과 같은 화면을 구현해보세요.
//화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
//List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트와 오른쪽에 체크마크 아이콘이 있습니다.
//체크마크 아이콘은 기본적으로 숨겨져 있으며, 행을 선택하면 보이게 됩니다.
//다른 행을 탭하면 이전에 선택된 행의 체크마크 아이콘이 사라지고, 새로 선택된 행의 체크마크 아이콘이 보이게 됩니다.

// 예시코드:
import SwiftUI

struct UIView3: View {
    @State private var selectedRow: Int? = nil
    
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        
        NavigationStack {
            List(1...10, id: \.self) { item in
                HStack {
                    Text("Item \(item)")
                    
                    Spacer()
                    
                    if selectedRow == item {
                        Image(systemName: "checkmark")
                    }
                }
                .onTapGesture {
                    
                    if selectedRow == item {
                        selectedRow = nil
                    } else {
                        selectedRow = item
                    }
                }
            }
        }
    }
}

#Preview {
    UIView3()
}
