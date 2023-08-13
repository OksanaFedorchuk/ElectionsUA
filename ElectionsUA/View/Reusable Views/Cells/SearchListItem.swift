//
//  SearchListItem.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 27.05.2022.
//

import SwiftUI

struct SearchListItem: View {

    @Environment(\.colorScheme) var colorScheme
    @State var textMain: String
    @State var textSecondary: String
    @Binding var searchText: String

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HighlitedText(text: textMain, searchText: $searchText, color: .blue) // R.color.navBarColor()!)
//                    .font(Font(uiFont: R.font.gilroyBold(size: 20)
//                               ?? .systemFont(ofSize: 20)))
                    .foregroundColor(.primary)
                    .lineSpacing(8)
                    .lineLimit(5)
                    .padding(.bottom, 2)
                HighlitedText(text: textSecondary, searchText: $searchText, color: .blue) //R.color.navBarColor()!)
//                    .font(Font(uiFont: R.font.gilroyRegular(size: 18)
//                               ?? .systemFont(ofSize: 18)))
                    .foregroundColor(.secondary)
                    .lineSpacing(10)
                    .lineLimit(5)
            }
            .multilineTextAlignment(.leading)
            MyDashLine(colorScheme: colorScheme, isHorisontal: true)
        }
    }
}
