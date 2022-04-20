//
//  BackGradient.swift
//  ВибориUA
//
//  Created by Administrator on 25.01.2022.
//

import SwiftUI

struct BackGradient: View {
    var colorScheme: ColorScheme
    var body: some View {
        LinearGradient(colors: colorScheme == .dark
                       ? [K.Colors.tabGradientStart, K.Colors.tabGradientEnd]
                       : [.white],
                       startPoint: .leading,
                       endPoint: .trailing)
            .ignoresSafeArea(edges: [.top, .bottom])
    }
}
