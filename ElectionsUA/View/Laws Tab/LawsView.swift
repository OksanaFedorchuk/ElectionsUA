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

    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                HStack(alignment: .top) {
                    Spacer()
                    NavigationLink(tag: "1", selection: $stateManager.selection) {
                        // show first law
                        BooksListView(vm: BooksListVM(db: CodeDB()))
                            .environmentObject(stateManager)
                    } label: {
                        LawGridItem(image: R.image.lawOne()!,
                                    textMain: R.string.lawsTab.electoral(),
                                    textSecondary: R.string.lawsTab.codeOfUkraine())
                        .onTapGesture {
                            stateManager.selection = "1"
                        }
                        .frame(width: proxy.size.width / 2.5)
                    }
                    .isDetailLink(false)

                    MyDashLine(colorScheme: colorScheme, isHorisontal: false)
                    Spacer()

                    NavigationLink(tag: "2", selection: $stateManager.selection) {
                        // show second law
                        ChaptersListView(vm: ChaptersListVM(db: NardepyDB(), book: nil))
                            .environmentObject(stateManager)
                    } label: {
                        LawGridItem(image: R.image.lawTwo()!,
                                    textMain: R.string.lawsTab.lawOfUkraine(),
                                    textSecondary: R.string.lawsTab.onDeputies())
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
                        // show third law
                        ChaptersListView(vm: ChaptersListVM(db: ReferendumDB(), book: nil))
                            .environmentObject(stateManager)
                    } label: {
                        LawGridItem(image: R.image.lawThree()!,
                                    textMain: R.string.lawsTab.lawOfUkraine(),
                                    textSecondary: R.string.lawsTab.onReferendum())
                        .onTapGesture {
                            stateManager.selection = "3"
                        }
                        .frame(width: proxy.size.width / 2.5)
                    }
                    .isDetailLink(false)

                    MyDashLine(colorScheme: colorScheme, isHorisontal: false)
                    Spacer()

                    NavigationLink(tag: "4", selection: $stateManager.selection) {
                        // show fourth law
                        ChaptersListView(vm: ChaptersListVM(db: PartiesDB(), book: nil))
                            .environmentObject(stateManager)
                    } label: {
                        LawGridItem(image: R.image.lawFour()!,
                                    textMain: R.string.lawsTab.lawOfUkraine(),
                                    textSecondary: R.string.lawsTab.onParties())
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

    var image: UIImage
    var textMain: String
    var textSecondary: String

    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: image)
            Text(textMain)
                .font(Font(uiFont: R.font.gilroyRegular(size: 22)
                           ?? .systemFont(ofSize: 22)))
                .foregroundColor(.primary)
            Text(textSecondary)
                .font(Font(uiFont: R.font.gilroyRegular(size: 14)
                           ?? .systemFont(ofSize: 14)))
                .foregroundColor(.secondary)
        }
        .multilineTextAlignment(.leading)
    }
}
