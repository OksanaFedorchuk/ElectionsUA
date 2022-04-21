//
//  CustomTabView.swift
//  ВибориUA
//
//  Created by Oksana Fedorchuk on 02.12.2021.
//

import SwiftUI

enum Tab {
    case laws, protocols, saved, search
}

/// Tab view for custom design containing four tabs: laws, protocols, saved, search
struct CustomTabView: View {

    @Environment(\.colorScheme) var colorScheme
    @Binding var tabIndex: Tab

    var body: some View {
        ZStack {

            TabGradient()

            HStack {
                Group {
                    Spacer()

                    TabButton(tabIndexParent: $tabIndex, tabType: .laws) {
                        self.tabIndex = .laws
                    }

                    Spacer()
                    TabButton(tabIndexParent: $tabIndex, tabType: .protocols) {
                        self.tabIndex = .protocols
                    }

                    Spacer()
                    TabButton(tabIndexParent: $tabIndex, tabType: .saved) {
                        self.tabIndex = .saved
                    }

                    Spacer()
                    TabButton(tabIndexParent: $tabIndex, tabType: .search) {
                        self.tabIndex = .search
                    }

                    Spacer()
                }
            }
            .padding([.bottom, .top], 10)
        }
        .frame(height: 100)
    }
}

// MARK: - Previews

struct CustomTabViewLight: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabIndex: .constant(.laws))
            .preferredColorScheme(.light)
    }
}

struct CustomTabViewDark: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabIndex: .constant(.laws))
            .preferredColorScheme(.dark)
    }
}
