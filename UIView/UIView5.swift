//
//  UIView5.swift
//  AlignmentTool
//
//  Created by 강치우 on 11/1/23.
//

// SwiftUI List 예제 05

//List 를 사용하여 다음과 같은 화면을 구현해보세요.
//화면에는 "SwiftUI List Quiz" 라는 제목이 있습니다.
//List 에는 10개의 행이 있으며, 각 행에는 "Item 1", "Item 2", ... , "Item 10" 이라는 텍스트와 오른쪽에 삭제 버튼이 있습니다.
//삭제 버튼을 탭하면 해당 행이 삭제되고, 나머지 행들이 재정렬됩니다.

// 예시코드:
import SwiftUI

struct UIView5: View {
    
    @Environment(\.editMode) private var editMode
    @State private var items: [Int] = Array(1...10)
    
    var body: some View {
        Text("SwiftUI List Quiz")
            .font(.largeTitle)
            .padding()
        List {
            ForEach(items, id: \.self) { item in
                Text("item \(item)")
            }
            .onDelete(perform: { indexSet in
                self.items.remove(atOffsets: indexSet)
            })
            .onMove(perform: { indices, newOffset in
                self.items.move(fromOffsets: indices, toOffset: newOffset)
            })
        }
    }
}

#Preview {
    UIView5()
}
