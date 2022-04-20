//
//  LawsView.swift
//  ВибориUA
//
//  Created by Oksana Fedorchuk on 27.07.2021.
//

import SwiftUI

struct LawsView: View {
    
    @EnvironmentObject var stateManager: StateManager
    @Environment(\.colorScheme) var colorScheme
//    @State var selection: String? = nil
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                HStack(alignment: .top) {
                    Spacer()
                    NavigationLink(tag: "1", selection: $stateManager.selection) {
                        //show first law
                        BooksListView(vm: BooksListVM(db: CodeDB()))
                            .environmentObject(stateManager)
                    } label: {
                        LawGridItem(imageStr: K.LawBacks.firstLaw,
                                    textMain: "Виборчий",
                                    textSecondary: "Кодекс України")
                            .onTapGesture {
                                stateManager.selection = "1"
                            }
                            .frame(width: proxy.size.width / 2.5)
                    }
                    .isDetailLink(false)
                    
                    MyDashLine(colorScheme: colorScheme, isHorisontal: false)
                    Spacer()
                    
                    NavigationLink(tag: "2", selection: $stateManager.selection) {
                        //show second law
                        ChaptersListView(vm: ChaptersListVM(db: NardepyDB(), book: nil))
                            .environmentObject(stateManager)
                    } label: {
                        LawGridItem(imageStr: K.LawBacks.secondLaw,
                                    textMain: "Закон України",
                                    textSecondary: "Про вибори народних депутатів України")
                            .onTapGesture {
                                stateManager.selection = "2"
                            }
                            .frame(width: proxy.size.width / 2.5)
                    }
                    .isDetailLink(false)
                    Spacer()
                }
                
                MyDashLine(colorScheme: colorScheme, isHorisontal: true)
                Spacer()
                
                HStack(alignment: .top) {
                    Spacer()
                    NavigationLink(tag: "3", selection: $stateManager.selection) {
                        //show third law
                        ChaptersListView(vm: ChaptersListVM(db: ReferendumDB(), book: nil))
                            .environmentObject(stateManager)
                    } label: {
                        LawGridItem(imageStr: K.LawBacks.thirdLaw,
                                    textMain: "Закон України",
                                    textSecondary: "Про всеукраїнський референдум")
                            .onTapGesture {
                                stateManager.selection = "3"
                            }
                            .frame(width: proxy.size.width / 2.5)
                    }
                    .isDetailLink(false)
                    
                    MyDashLine(colorScheme: colorScheme, isHorisontal: false)
                    Spacer()
                    
                    NavigationLink(tag: "4", selection: $stateManager.selection) {
                        //show fourth law
                        ChaptersListView(vm: ChaptersListVM(db: PartiesDB(), book: nil))
                            .environmentObject(stateManager)
                    } label: {
                        LawGridItem(imageStr: K.LawBacks.fourthLaw,
                                    textMain: "Закон України",
                                    textSecondary: "Про вибори Президента України")
                            .onTapGesture {
                                stateManager.selection = "4"
                            }
                            .frame(width: proxy.size.width / 2.5)
                    }
                    .isDetailLink(false)
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LawsView()
            .preferredColorScheme(.light)
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        LawsView()
            .preferredColorScheme(.dark)
    }
}

struct LawGridItem: View {
    var imageStr: String
    var textMain: String
    var textSecondary: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageStr)
            Text(textMain)
                .font(VyboryFonts.gilroyRegular.of(size: 22))
                .foregroundColor(.primary)
            Text(textSecondary)
                .font(VyboryFonts.gilroyRegular.of(size: 14))
                .foregroundColor(.secondary)
        }
        .multilineTextAlignment(.leading)
    }
}
