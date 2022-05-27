//
//  View+Placeholder.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 27.04.2022.
//

import SwiftUI

// MARK: - Placeholder extension for textfield

// Placeholder, that allows to set Text as a placeholder and receive access to all Text modifiers
extension View {

    func placeholder<Content: View>(

        when shouldShow: Bool,
        alignment: Alignment = .leading,

        @ViewBuilder placeholder: () -> Content) -> some View {

            ZStack(alignment: alignment) {
                placeholder()
                    .opacity(shouldShow ? 0.3 : 0)
                self
            }
        }
}
