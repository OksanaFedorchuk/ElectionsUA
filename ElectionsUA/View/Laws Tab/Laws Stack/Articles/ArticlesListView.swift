//
//  ArticlesListView.swift
//  ВибориUA
//
//  Created by Administrator on 20.01.2022.
//

import SwiftUI

struct ArticlesListView: View {

    @EnvironmentObject var stateManager: StateManager
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var vm: ArticlesListVM

    var body: some View {
        ScrollView {

            MyBottomNavLine(colorScheme: colorScheme)

            LazyVStack(alignment: .leading) {
                ForEach(vm.articles, id: \.self) { article in
                    ListItem(textMain: "\(article.number)",
                             textSecondary: "\(article.title)")
                        .onTapGesture {
                            // go to artcile details for the selected article
                            stateManager.currentArticle = article.id
                            stateManager.showingArticle = true
                        }
                }
            }
            NavigationLink(isActive: $stateManager.showingArticle) {
                ArticleView(vm: ArticleVM(db: vm.db as! DBReadableWriteable,
                                          articleSelected: stateManager.currentArticle))
                    .environmentObject(stateManager)
            } label: {}
            .isDetailLink(false)
        }
        // set backgound: blue gradient for dark mode and white color for light mode
        .background(BackGradient(colorScheme: colorScheme))
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(stateManager.currentChapter ?? "")
        .onAppear {
            print("LIFE: Articles on appear")
        }
        .onDisappear {
            print("LIFE: Articles on disappear")
        }
    }
}

// MARK: - Previews

// struct KodeksArticles_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticlesListView(vm: ArticlesListVM(chapter: "Розділ"))
//            .preferredColorScheme(.light)
//    }
// }
//
// struct KodeksArticles1_Previews: PreviewProvider {
//    static var previews: some View {
//        KodeksArticles(vm: KodeksArticlesVM(chapter: "Розділ"))
//            .preferredColorScheme(.dark)
//    }
// }
