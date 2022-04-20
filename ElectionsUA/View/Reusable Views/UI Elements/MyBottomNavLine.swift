//
//  MyBottomNavLine.swift
//  ВибориUA
//
//  Created by Administrator on 20.01.2022.
//

import SwiftUI

struct MyBottomNavLine: View {
    @State var colorScheme: ColorScheme
    var body: some View {
        Rectangle()
            .frame(height: 0.6)
            .foregroundColor(colorScheme == .light
                             ? K.Colors.tabGradientStart.opacity(0.3)
                             : .white.opacity(0.3))
    }
}

struct MyBottomNavLine_Previews: PreviewProvider {
    static var previews: some View {
        MyBottomNavLine(colorScheme: .light)
    }
}
