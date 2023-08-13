//
//  KodeksTab.swift
//  ВибориUA
//
//  Created by Oksana Fedorchuk on 05.10.2021.
//

import SwiftUI

struct BooksListView: View {

    @EnvironmentObject var stateManager: StateManager
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var vm: BooksListVM

    init(vm: BooksListVM) {
        self.vm = vm
    }

    var body: some View {
        ScrollView {
            MyBottomNavLine(colorScheme: colorScheme)
            LazyVStack(alignment: .leading) {
                ForEach(vm.books, id: \.self) { book in
                    ListItem(textMain: "\(book.number)",
                             textSecondary: "\(book.title)")
                    .onTapGesture {
                        // go to chapters in book
                        stateManager.currentBook = book.number
                        stateManager.showingChapter = true
                    }
                }
            }
            NavigationLink(isActive: $stateManager.showingChapter) {
                ChaptersListView(vm: ChaptersListVM(db: vm.db, book: stateManager.currentBook))
                    .environmentObject(stateManager)
            } label: {
            }
            .isDetailLink(false)
        }
        // set backgound: blue gradient for dark mode and white color for light mode
        .background(BackGradient(colorScheme: colorScheme))
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
//        .navigationTitle(R.string.lawsTab.code())
        .onAppear {
            print("LIFE: Books onappear")
        }
        .onDisappear {
            print("LIFE: Books on disappear")
        }
    }
}

// MARK: - Previews
//
// struct KodeksCollection_Previews: PreviewProvider {
//    static var previews: some View {
//        BooksListView()
//            .preferredColorScheme(.light)
//    }
// }
//
// struct KodeksCollection1_Previews: PreviewProvider {
//    static var previews: some View {
//        BooksListView()
//            .preferredColorScheme(.dark)
//    }
// }
