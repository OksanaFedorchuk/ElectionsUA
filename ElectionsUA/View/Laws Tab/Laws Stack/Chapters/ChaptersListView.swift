//
//  ChaptersListView.swift
//  ВибориUA
//
//  Created by Administrator on 20.01.2022.
//

import SwiftUI

struct ChaptersListView: View {
    
    @EnvironmentObject var stateManager: StateManager
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var vm: ChaptersListVM
    
    var body: some View {
        ScrollView {
            
            MyBottomNavLine(colorScheme: colorScheme)
            
            LazyVStack(alignment: .leading) {
                ForEach(vm.chapters, id: \.self) { chapter in
                    ListItem(textMain: "\(chapter.number)",
                             textSecondary: "\(chapter.title)")
                        .onTapGesture {
                            //go to artciles in the selected chapter
                            stateManager.currentChapter = chapter.number
                            stateManager.showingArticles = true
                        }
                }
            }
            NavigationLink(isActive: $stateManager.showingArticles) {
                //present the list of articles 
                ArticlesListView(vm: ArticlesListVM(db: vm.db, chapter: stateManager.currentChapter ?? ""))
                    .environmentObject(stateManager)
            } label: {}
            .isDetailLink(false)
        }
        //set backgound: blue gradient for dark mode and white color for light mode
        .background(BackGradient(colorScheme: colorScheme))
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle((stateManager.currentBook ?? vm.db.name) ?? "")
        .onAppear {
            print("LIFE: Chapters onappear")
        }
        .onDisappear {
            print("LIFE: Chapters on disappear")
        }
    }
}

//struct KodeksChapters_Previews: PreviewProvider {
//    static var previews: some View {
//        KodeksChapters(vm: ChaptersListVM(book: "Книга Перша"))
//    }
//}
