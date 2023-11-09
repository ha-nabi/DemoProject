//
//  ex1.swift
//  DemoProject
//
//  Created by 강치우 on 10/30/23.
//

import SwiftUI

extension Image {
    func minji() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
        
    }
    
}

extension Button {
    func lionButtonModifier() -> some View {
        self
            .frame(width: 80)
            .padding(5)
            .foregroundColor(.white)
            .background(.indigo)
            .cornerRadius(5)
    }
}

struct abcd: View {
    var body: some View {
        VStack {
            HStack {
                Image("민지")
                    .minji()
            }
            HStack {
                Image("민지")
                    .minji()
                Image("민지")
                    .minji()
                Image("민지")
                    .minji()
            }
            HStack {
                Image("민지")
                    .minji()
                Image("민지")
                    .minji()
                Image("민지")
                    .minji()
            }
            Spacer()
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                Spacer()
                .buttonStyle(.bordered)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                Spacer()
                .buttonStyle(.bordered)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

#Preview {
    abcd()
}
