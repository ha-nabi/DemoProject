//
//  AppStorage.swift
//  DemoProject
//
//  Created by 강치우 on 10/30/23.
//

import SwiftUI

struct UserName: Encodable, Decodable {
    var firstName: String
    var secondName: String
}

struct AppStorage1: View {

    @AppStorage("mytext") var editorText: String = "Sample Text"
    @AppStorage("username") var namestore: Data = Data()

    @State var username = UserName(firstName: "", secondName: "")

    var body: some View {
        VStack {
            HStack {
                TextField("firstname", text: $username.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onAppear() {
                        let decoder = JSONDecoder()

                        if let name = try? decoder.decode(UserName.self, from: namestore) {
                            username = name
//                            editorText = "\(name.firstName), \(name.secondName)"
                        }
                    }
                TextField("secondname", text: $username.secondName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()

            Button("username save") {
                let encoder = JSONEncoder()

                if let data = try? encoder.encode(username) {
                    namestore = data
//                    editorText = data.base64EncodedString()
                }
            }

            TextEditor(text: $editorText)
                .padding()
                .font(.largeTitle)
        }
        .background(Color.teal)
    }
}

#Preview {
    AppStorage1()
}
