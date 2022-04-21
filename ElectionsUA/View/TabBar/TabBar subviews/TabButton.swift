//
//  TabButton.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 22.04.2022.
//

import SwiftUI

struct TabButton: View {

    @Environment(\.colorScheme) var colorScheme
    @Binding var tabIndexParent: Tab
    @State var tabType: Tab

    let action: (() -> Void)

    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                switch tabType {

                case .laws:
                    Image(uiImage: R.image.lawTab()!)
                    Text(R.string.lawsTab.laws())
                        .font(.system(size: 14))

                case .protocols:
                    Image(uiImage: R.image.protocolTab()!)
                    Text(R.string.lawsTab.protocol())
                        .font(.system(size: 14))

                case .saved:
                    Image(uiImage: R.image.flagTab()!)
                    Text(R.string.lawsTab.favourite())
                        .font(.system(size: 14))

                case .search:
                    Image(uiImage: R.image.searchTab()!)
                    Text(R.string.lawsTab.search())
                        .font(.system(size: 14))
                }
            }
        }
        .foregroundColor(tabIndexParent == tabType
                         ? Color(R.color.myYellow() ?? .gray)
                         : (colorScheme == .light ? .white.opacity(0.8) : .yellow))
    }
}
