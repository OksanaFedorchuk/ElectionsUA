//
//  TabGradient.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 22.04.2022.
//

import SwiftUI

struct TabGradient: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        // Background color for dark/light scheme,
        // made separately to ignore safe area on bottom behind the custom tab bar
        LinearGradient(colors: colorScheme == .light
//                       ? [Color(R.color.tabGradientStart() ?? .gray),
//                          Color(R.color.tabGradientEnd() ?? .gray)]
                       ? [.gray]
                       : [.white],
                       startPoint: .leading,
                       endPoint: .trailing)
        .ignoresSafeArea(edges: .bottom)
        .cornerRadius(30, corners: [.topRight, .topLeft])
    }
}
