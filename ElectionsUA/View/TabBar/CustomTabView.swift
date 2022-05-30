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
            /// Background color for dark/light scheme,
            /// made separately to ignore safe area on bottom behind the custom tab bar
            LinearGradient(colors: colorScheme == .light
                           ? [Color(R.color.tabGradientStart() ?? .gray),
                              Color(R.color.tabGradientEnd() ?? .gray)]
                           : [.white],
                           startPoint: .leading,
                           endPoint: .trailing)
            .ignoresSafeArea(edges: .bottom)
            .cornerRadius(30, corners: [.topRight, .topLeft])
            HStack {
                Group {
                    Spacer()

                    Button {
                        self.tabIndex = .laws
                    } label: {
                        VStack {
                            Image(uiImage: R.image.lawTab()!)
                            Text(R.string.lawsTab.laws())
                                .font(.system(size: 14))
                        }
                    }
                    .foregroundColor(self.tabIndex == .laws
                                     ? Color(R.color.myYellow() ?? .gray)
                                     : (colorScheme == .light ? .white.opacity(0.8) : .yellow))

                    Spacer()
                    Button {
                        self.tabIndex = .protocols
                    } label: {
                        VStack {
                            Image(uiImage: R.image.protocolTab()!)
                            Text(R.string.lawsTab.protocol())
                                .font(.system(size: 14))
                        }
                    }
                    .foregroundColor(self.tabIndex == .protocols
                                     ? Color(R.color.myYellow() ?? .gray)
                                     : (colorScheme == .light ? .white.opacity(0.8) : .yellow))

                    Spacer()
                    Button {
                        self.tabIndex = .saved
                    } label: {
                        VStack {
                            Image(uiImage: R.image.flagTab()!)
                            Text(R.string.lawsTab.favourite())
                                .font(.system(size: 14))
                        }
                    }
                    .foregroundColor(self.tabIndex == .saved
                                     ? Color(R.color.myYellow() ?? .gray)
                                     : (colorScheme == .light ? .white.opacity(0.8) : .yellow))
                    Spacer()
                    
                    Button(action: {
                        self.tabIndex = .search
                    }, label: {
                        VStack {
                            Image(uiImage: R.image.searchTab()!)
                            Text(R.string.lawsTab.search())
                                .font(.system(size: 14))
                        }
                    })
                    .foregroundColor(self.tabIndex == .search
                                     ? Color(R.color.myYellow() ?? .gray)
                                     : (colorScheme == .light ? .white.opacity(0.8) : .yellow))
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
