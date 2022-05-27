//
//  ClearButtonModifier.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 27.04.2022.
//

import SwiftUI

struct ClearButtonModifier: ViewModifier {

    @Binding var text: String

    public func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            Image(systemName: "xmark")
                .opacity(text == "" ? 0 : 1)
                .onTapGesture { self.text = "" } // onTapGesture or plainStyle button
        }
    }
}
