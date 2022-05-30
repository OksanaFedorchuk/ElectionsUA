//
//  BindedListItem.swift
//  ВибориUA
//
//  Created by Administrator on 31.01.2022.
//

import SwiftUI

struct BindedListItem: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var textMain: String
    @Binding var textSecondary: String

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(textMain)
                    .font(VyboryFonts.gilroyBold.of(size: 20))
                    .foregroundColor(.primary)
                    .lineSpacing(8)
                    .padding(.bottom, 2)
                Text(textSecondary)
                    .font(VyboryFonts.gilroyRegular.of(size: 18))
                    .foregroundColor(.secondary)
                    .lineSpacing(10)
            }
            .padding([.leading, .trailing], 15)
            .multilineTextAlignment(.leading)
            MyDashLine(colorScheme: colorScheme, isHorisontal: true)
                .padding(.horizontal, 15)
        }
    }
}