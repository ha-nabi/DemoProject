//
//  AligmentView.swift
//  DemoProject
//
//  Created by 강치우 on 10/30/23.
//

import SwiftUI

extension VerticalAlignment {
    private enum OneThird : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}

struct AligmentView: View {
    var body: some View {
        VStack(spacing: 50) {
            // 컨테이너 정렬 VStack
            VStack(alignment: .trailing) {
                Text("This is some text")
                Text("This is some longer text")
                Text("This is short")
            }
            // 컨테이너 정렬 HStack
            HStack(alignment: .lastTextBaseline, spacing: 20) {
                Text("This is some text")
                    .font(.largeTitle)
                Text("This is some longer text")
                    .font(.body)
                Text("This is short")
                    .font(.headline)
            }
            // 정렬 가이드 p.285
            VStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 120, height: 50)
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 120, height: 50)
                    .alignmentGuide(.leading, computeValue: { d in
                        120.0   // 고정값
                    })
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 120, height: 50)
                    .alignmentGuide(.leading, computeValue: { d in
                        d.width / 3    // 비율
                    })
                // HorizontalAlignment, VerticalAlignment 프로퍼티에 접근
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: 120, height: 50)
                    .alignmentGuide(.leading, computeValue: { d in
                        d[HorizontalAlignment.trailing] + 50
                    })
            }
            // 커스텀 정렬 타입 p.288
            HStack(alignment: .oneThird) {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 50, height: 100)
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 50, height: 100)
                    .alignmentGuide(.oneThird, computeValue: { d in
                        d[VerticalAlignment.bottom]
                    })
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 50, height: 100)
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 50, height: 100)
                    .alignmentGuide(.oneThird, computeValue: { d in
                        d[VerticalAlignment.top]
                    })
            }
        }
    }
}

#Preview {
    AligmentView()
}
