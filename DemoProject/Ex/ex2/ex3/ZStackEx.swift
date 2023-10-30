//
//  ZStack.swift
//  DemoProject
//
//  Created by 강치우 on 10/30/23.
//

import SwiftUI

extension VerticalAlignment {
    private enum CrossAligment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.bottom]
        }
    }
}

struct ZStackEx: View {
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(.purple)
                .frame(width: 100)
            VStack {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: 100, height: 100)
            }
        }
        .padding()
    }
}

#Preview {
    ZStackEx()
}
