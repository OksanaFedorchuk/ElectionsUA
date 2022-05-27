//
//  Article.swift
//  VYBORY
//
//  Created by Oksana Fedorchuk on 20.11.2020.
//

import Foundation

class Article: Hashable {

    var id: Int
    var number: String
    var title: String
    var content: String
    var favourite: Int
    var bookNum: String
    var chapterNumber: String

    init() {
        self.id = 0
        self.number = ""
        self.title = ""
        self.content = ""
        self.favourite = 0
        self.bookNum = ""
        self.chapterNumber = ""
    }

    init(with model: UniversalDBModel) {
        self.id = model.articleID
        self.number = model.number
        self.title = model.title
        self.content = model.content
        self.favourite = model.favourite
        self.bookNum = model.bookNum
        self.chapterNumber = model.chapterNum
    }

    init(id: Int, number: String, title: String,
         content: String, favourite: Int,
         chapterNumber: String, bookNum: String) {
        self.id = id
        self.number = number
        self.title = title
        self.content = content
        self.favourite = favourite
        self.bookNum = bookNum
        self.chapterNumber = chapterNumber
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }

    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.number == rhs.number && lhs.title == rhs.title
    }
}

extension Article: Identifiable {
}
