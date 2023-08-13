//
//  SearchTextFieldModifier.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 27.04.2022.
//

import SwiftUI

// MARK: - SearchTextfieldModifier

// Custom modifier for my textfield, any modifier values can be accessed via properties if needed
struct SearchTextFieldModifier: ViewModifier {

    @State var colorScheme: ColorScheme

    func body(content: Content) -> some View {
        content
            .padding()
            .padding(.vertical, 5)
            .cornerRadius(12)
//            .foregroundColor(Color(R.color.tabGradientStart()
//                                   ?? .blue))
//            .overlay(RoundedRectangle(cornerRadius: 12)
//                .stroke(colorScheme == .light
//                        ? Color(R.color.tabGradientStart()
//                                ?? .gray).opacity(0.3)
//                        : .clear, lineWidth: 0.6))
//            .font(Font(uiFont: R.font.gilroyMedium(size: 18)
//                       ?? .systemFont(ofSize: 18)))
    }
}
