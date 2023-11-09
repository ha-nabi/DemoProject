//
//  AppStorageView.swift
//  DemoProject
//
//  Created by 강치우 on 10/26/23.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("mytext") private var editorText: String = "Sample Text"
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    AppStorageView()
}
