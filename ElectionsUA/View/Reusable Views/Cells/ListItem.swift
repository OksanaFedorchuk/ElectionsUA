//
//  ListItem.swift
//  ВибориUA
//
//  Created by Administrator on 20.01.2022.
//

import SwiftUI

struct ListItem: View {

    @Environment(\.colorScheme) var colorScheme
    @State var textMain: String
    @State var textSecondary: String
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(textMain)
                    .font(Font(uiFont: R.font.gilroyBold(size: 20)
                               ?? .systemFont(ofSize: 20)))
                    .foregroundColor(.primary)
                    .lineSpacing(8)
                    .padding(.bottom, 2)
                Text(textSecondary)
                    .font(Font(uiFont: R.font.gilroyRegular(size: 18)
                               ?? .systemFont(ofSize: 18)))
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
