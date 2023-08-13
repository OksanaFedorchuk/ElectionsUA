//
//  ArticleDetailsVM.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 25.04.2022.
//

import SwiftUI
import Combine

class ArticleDetailsVM: ObservableObject {
    
    @Published var textMain: String
    @Published var textSecondary: String
    @Published var fullText = NSAttributedString(string: "")
    
    private var cancellables = Set<AnyCancellable>()
    
    init(textMain: String, textSecondary: String) {
        self.textMain = textMain
        self.textSecondary = textSecondary
        
        subscribeText()
    }
    
    private func subscribeText() {
        $textMain
            .combineLatest($textSecondary)
            .map { textMain, textSecondary in
                self.generateAttributedArticleText(titleText: textMain, contentText: textSecondary)
            }
            .assign(to: \.fullText, on: self)
            .store(in: &cancellables)
    }
    
    //    make an attributed string containing title and content of an article
    func generateAttributedArticleText(titleText: String, contentText: String) -> NSAttributedString {
        
        let title = ""
//        NSAttributedString(string: titleText, attributes: [.font: R.font.gilroySemiBold(size: 20)
//                                                                       ?? .systemFont(ofSize: 20)])
        let content = ""
//        NSAttributedString(string: contentText, attributes: [.font: R.font.gilroyRegular(size: 18)
//                                                                           ?? .systemFont(ofSize: 18)])
        let attributedArticle = NSMutableAttributedString()
        
//        attributedArticle.append(title)
//        attributedArticle.append(NSAttributedString(string: " \n \n"))
//        attributedArticle.append(content)
        
        return attributedArticle
    }
}
