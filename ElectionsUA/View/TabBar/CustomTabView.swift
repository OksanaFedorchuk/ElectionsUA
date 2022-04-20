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

///Tab view for custom design containing four tabs: laws, protocols, saved, search
struct CustomTabView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var tabIndex: Tab
    
    var body: some View {
        ZStack {
            ///Background color for dark/light scheme,
            ///made separately to ignore safe area on bottom behind the custom tab bar
            LinearGradient(colors: colorScheme == .light
                           ? [K.Colors.tabGradientStart, K.Colors.tabGradientEnd]
                           : [.white],
                           startPoint: .leading,
                           endPoint: .trailing)
                .ignoresSafeArea(edges: .bottom)
                .cornerRadius(30, corners: [.topRight, .topLeft])
            HStack {
                Group {
                    Spacer()
                    
                    Button (action: {
                        self.tabIndex = .laws
                    }) {
                        VStack {
                            Image(K.IconsTabBar.lawTab)
                            Text("Закони")
                                .font(.system(size: 14))
                        }
                    }
                    .foregroundColor(self.tabIndex == .laws
                                     ? K.Colors.myYellow
                                     : (colorScheme == .light ? .white.opacity(0.8) : .yellow))
                    
                    Spacer()
                    Button (action: {
                        self.tabIndex = .protocols
                    }) {
                        VStack {
                            Image(K.IconsTabBar.protocolTab)
                            Text("Протокол")
                                .font(.system(size: 14))
                        }
                    }
                    .foregroundColor(self.tabIndex == .protocols
                                     ? K.Colors.myYellow
                                     : (colorScheme == .light ? .white.opacity(0.8) : .yellow))
                    
                    Spacer()
                    Button (action: {
                        self.tabIndex = .saved
                    }) {
                        VStack {
                            Image(K.IconsTabBar.savedTab)
                            Text("Обране")
                                .font(.system(size: 14))
                        }
                    }
                    .foregroundColor(self.tabIndex == .saved
                                     ? K.Colors.myYellow
                                     : (colorScheme == .light ? .white.opacity(0.8) : .yellow))
                    Spacer()
                    
                    Button(action: {
                        self.tabIndex = .search
                    }, label: {
                        VStack {
                            Image(K.IconsTabBar.searchTab)
                            Text("Пошук")
                                .font(.system(size: 14))
                        }
                    })
                        .foregroundColor(self.tabIndex == .search
                                         ? K.Colors.myYellow
                                         : (colorScheme == .light ? .white.opacity(0.8) : .yellow))
                    Spacer()
                }
            }
            .padding([.bottom, .top], 10)
        }
        .frame(height: 100)
    }
}

//MARK: - Previews

struct CustomTabView_Light: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabIndex: .constant(.laws))
            .preferredColorScheme(.light)
    }
}

struct CustomTabView_Dark: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabIndex: .constant(.laws))
            .preferredColorScheme(.dark)
    }
}
