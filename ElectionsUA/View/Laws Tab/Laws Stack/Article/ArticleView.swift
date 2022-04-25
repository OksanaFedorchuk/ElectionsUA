//
//  ArticleView.swift
//  ВибориUA
//
//  Created by Administrator on 21.01.2022.
//

import SwiftUI

struct ArticleView: View {
    
    @EnvironmentObject var stateManager: StateManager
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var vm: ArticleVM
    
    @GestureState var translation: CGSize = .zero
    @State var isAnimated: Bool = false
    let threshold: CGFloat = 0.5
    
    var body: some View {
        // drag gesture to navigate between articles
        let dragGesture = DragGesture()
            .updating($translation) { value, state, _ in
                state = value.translation
            }
            .onEnded { value in
                // start animating the view after first swipe
                isAnimated = true
                let dragPercentage = value.translation.width / UIScreen.main.bounds.size.width
                if abs(dragPercentage) > threshold {
                    // get next article
                    if value.startLocation.x > value.location.x {
                        // left
                        vm.setNext()
                        // update current chapter number in stateManager if needed
                        if vm.article.chapterNumber != stateManager.currentChapter {
                            stateManager.currentChapter = vm.article.chapterNumber
                            stateManager.currentBook = vm.article.bookNum
                        }
                    } else if value.startLocation.x < value.location.x {
                        // right
                        vm.setPrevious()
                        // update current chapter number in stateManager if needed
                        if vm.article.chapterNumber != stateManager.currentChapter {
                            stateManager.currentChapter = vm.article.chapterNumber
                            stateManager.currentBook = vm.article.bookNum
                        }
                    }
                }
            }
        VStack {
            BindedListItem(vm: BindedListItemVM(textMain: vm.article.title, textSecondary: vm.article.content))
        }
        .offset(x: translation.width,
                y: 0)
        .gesture(dragGesture)
        .animation(isAnimated ? Animation.easeIn.speed(0.5) : .none)
        // set backgound: blue gradient for dark mode and white color for light mode
        .background(BackGradient(colorScheme: colorScheme))
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(vm.article.number)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // toggles the given article's saved state in db
                    vm.isSaved.toggle()
                } label: {
                    Image(uiImage: vm.isSaved ? R.image.flagSelected()! : R.image.flag()!)
                }
            }
        }
        .onAppear {
            print("LIFE: Article on appear")
        }
        .onDisappear {
            print("LIFE: Article on disappear")
        }
    }
}
