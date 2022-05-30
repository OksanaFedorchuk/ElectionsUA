//
//  HomeTab.swift
//  ВибориUA
//
//  Created by Oksana Fedorchuk on 05.10.2021.
//

import SwiftUI

/// The home page for application, starts with Laws tab and a set of four laws to choose from
struct HomeTab: View {

    @StateObject var stateManager = StateManager()
    @Environment(\.colorScheme) var colorScheme
    @State var tabIndex: Tab = .laws

    // setting the color for navigation bar
    init() {
        // prevent Nav Bar color change on scroll view push behind NavBar
        let standardAppearence = UINavigationBarAppearance()
        standardAppearence.titleTextAttributes = [.foregroundColor: K.Colors.navBarColorUI]
        standardAppearence.largeTitleTextAttributes = [.foregroundColor: K.Colors.navBarColorUI]
        UINavigationBar.appearance().standardAppearance = standardAppearence

        UINavigationBar.appearance().barTintColor = K.Colors.navBarColorUI
        UINavigationBar.appearance().tintColor = K.Colors.navBarColorUI
    }

    var body: some View {

        NavigationView {
            VStack {
                MyBottomNavLine(colorScheme: colorScheme)

                // main View above tab bar
                switch tabIndex {
                case .laws:
                    LawsView()
                        .environmentObject(stateManager)
                case .protocols:
                    ProtocolsTab()
                case .saved:
                    SavedTab()
                case .search:
                    SearchTab()
                }

                CustomTabView(tabIndex: $tabIndex)
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationTitle("Закони")
            .toolbar {
                Button {
                    // opens info view
                } label: {
                    Image(K.IconsNavBar.info)
                        .resizable()
                }
            }
            // set backgound: blue gradient for dark mode and white color for light mode
            .background(LinearGradient(colors: colorScheme == .dark
                                       ? [K.Colors.tabGradientStart, K.Colors.tabGradientEnd]
                                       : [.white],
                                       startPoint: .leading,
                                       endPoint: .trailing)
                            .ignoresSafeArea(edges: .top))
            .onAppear {
                print("LIFE: Main on appear")
                stateManager.currentBook = nil
            }
            .onDisappear {
                print("LIFE: Main on disappear")
            }
        }
    }
}

// struct HomeTab_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeTab()
//            .preferredColorScheme(.light)
//    }
// }
//
// struct HomeTab1_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeTab()
//            .preferredColorScheme(.dark)
//    }
// }
