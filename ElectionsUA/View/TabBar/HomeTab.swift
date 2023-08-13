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
//        // prevent Nav Bar color change on scroll view push behind NavBar
//        let standardAppearence = UINavigationBarAppearance()
//        standardAppearence.titleTextAttributes = [.foregroundColor: R.color.navBarColor()!]
//        standardAppearence.largeTitleTextAttributes = [.foregroundColor: R.color.navBarColor()!]
//        UINavigationBar.appearance().standardAppearance = standardAppearence
//
//        UINavigationBar.appearance().barTintColor = R.color.navBarColor()!
//        UINavigationBar.appearance().tintColor = R.color.navBarColor()!
    }

    var body: some View {

        NavigationView {
            VStack {
                NavigationLink(isActive: $stateManager.showingInfo) {
                    InfoView()
                        .environmentObject(stateManager)
                } label: {
                }
                .isDetailLink(false)

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
                    SearchTab(vm: SearchTabVM(db: NardepyDB()))
                }

                CustomTabView(tabIndex: $tabIndex)
            }
            .ignoresSafeArea(edges: .bottom)
//            .navigationTitle(R.string.lawsTab.laws())
            .toolbar {
                Button {
                    stateManager.showingInfo = true
                } label: {
//                    Image(uiImage: R.image.info()!)
//                        .resizable()
                }
            }
//            // set backgound: blue gradient for dark mode and white color for light mode
//            .background(LinearGradient(colors: colorScheme == .dark
//                                       ? [Color(R.color.tabGradientStart() ?? .gray),
//                                          Color(R.color.tabGradientEnd() ?? .gray)]
//                                       : [.white],
//                                       startPoint: .leading,
//                                       endPoint: .trailing)
//                .ignoresSafeArea(edges: .top))
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
