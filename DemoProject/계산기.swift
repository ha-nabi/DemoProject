//
//  ContentView.swift
//  DemoProject
//
//  Created by 강치우 on 10/10/23.
//

import SwiftUI

enum ButtonType: String {
    case first, second, third, forth, fifth,
         sixth, seventh, eighth, nineth, zero
    case dot, equal, plus, minus, multiple, devide
    case percent, opposite, clear
    
    var buttonDisplayName: String {
        switch self {
        case .first :
            return "1"
        case .second :
            return "2"
        case .third :
            return "3"
        case .forth :
            return "4"
        case .fifth :
            return "5"
        case .sixth :
            return "6"
        case .seventh:
            return "7"
        case .eighth:
            return "8"
        case .nineth:
            return "9"
        case .zero:
            return "0"
        case .dot:
            return "."
        case .equal:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiple:
            return "X"
        case .devide:
            return "÷"
        case .percent:
            return "%"
        case .opposite:
            return "+/-"
        case .clear:
            return "C"
        }
    } // 버튼타입 구성
    
    var backgroundColor: Color {
        switch self {
        case .first, .second, .third, .forth, .fifth, .sixth, .seventh,
                .eighth, .nineth, .zero, .dot:
            return Color("NumberButton")
        case .equal, .plus, .minus, .multiple, .devide:
            return Color.orange
        case .percent, .opposite, .clear:
            return Color.gray
        }
    } // 버튼 색 구성
    
    var forgroundColor: Color {
        switch self {
        case .first, .second, .third, .forth, .fifth, .sixth, .seventh,
                .eighth, .nineth, .zero, .dot, .equal, .plus, .minus, .multiple, .devide:
            return Color.white
        case .percent, .opposite, .clear:
            return Color.black
        }
    } // 폰트 색 설정
}
struct calculator: View {
    
    @State private var totalNumber: String = "0"
    @State var tempNumber: Int = 0
    @State var operatorType: ButtonType = .clear
    
    private let buttonData: [[ButtonType]] = [     // 버튼 뷰
        [.clear, .opposite, .percent, .devide],
        [.seventh, .eighth, .nineth, .multiple],
        [.forth, .fifth, .sixth, .minus],
        [.first, .second, .third, .plus],
        [.zero, .dot, .equal]
    ]
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() // 배경색
                
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(totalNumber) // 보이는 값
                        .padding()
                        .font(.system(size: 73))
                        .foregroundColor(.white)
                }
                
                // 기능 구현
                ForEach(buttonData, id: \.self) { line in
                    HStack {
                        ForEach(line, id: \.self) {
                            item in
                            Button {
                                if totalNumber == "0" { // 기본 디폴트 값은 0으로 시작
                                    
                                    if item == .clear {
                                        totalNumber = "0"
                                    } else if item == .plus ||
                                              item == .minus ||
                                              item == .multiple ||
                                              item == .devide {
                                        totalNumber = "Error"
                                    }
                                    else {
                                        totalNumber =
                                        item.buttonDisplayName
                                        }
                                    } else {
                                        if item == .clear {
                                            totalNumber = "0"
                                        } else if item == .plus {
                                            tempNumber = Int(totalNumber) ?? 0
                                            operatorType = .plus
                                            totalNumber = "0"
                                        } else if item == .multiple {
                                            tempNumber = Int(totalNumber) ?? 0
                                            operatorType = .multiple
                                            totalNumber = "0"
                                        } else if item == .minus {
                                            tempNumber = Int(totalNumber) ?? 0
                                            operatorType = .minus
                                            totalNumber = "0"
                                        } else if item == .devide {
                                            tempNumber = Int(totalNumber) ?? 0
                                            operatorType = .devide
                                            totalNumber = "0"
                                        
                                        } else if item == .equal {
                                            
                                            if operatorType == .plus {
                                                totalNumber = String((Int(totalNumber) ?? 0 ) + tempNumber)
                                                } else if operatorType == .multiple {
                                                totalNumber = String((Int(totalNumber) ?? 0 ) * tempNumber)
                                                } else if operatorType == .minus {
                                                totalNumber = String(tempNumber - (Int(totalNumber) ?? 0 ))
                                                } else if operatorType == .devide {
                                                    totalNumber = String(tempNumber / (Int(totalNumber) ?? 0 ))
                                                }
                                            }
                                            else {
                                            totalNumber += item.buttonDisplayName
                                        }
                                    }
                            } label: {
                                Text(item.buttonDisplayName)
                                    .frame(width: item == .some(.zero) ? 160 : 80,  // 0 크기 조절
                                           height: 80)
                                    .background(item.backgroundColor)
                                    .cornerRadius(40)
                                    .foregroundColor(item.forgroundColor)
                                    .font(.system(size: 33))
                            }
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    calculator()
}


// 개선해야할 부분 : 나누기 크기 조절 , 0 위치 왼쪽 정렬
// 숫자 클릭 후 연산 기호 눌렀을 때 기존의 숫자가 어떻게 남아있어야 할까?

