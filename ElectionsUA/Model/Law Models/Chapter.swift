//
//  Chapter.swift
//  VYBORY
//
//  Created by Oksana Fedorchuk on 28.12.2020.
//

import Foundation

class Chapter: Hashable {

    var number: String
    var title: String
    var bookNumber: String

    init(number: String, title: String, bookNumber: String) {
        self.number = number
        self.title = title
        self.bookNumber = bookNumber
    }

    init(with model: UniversalDBModel) {
        self.number = model.chapterNum
        self.title = model.chapterTitle
        self.bookNumber = model.bookNum
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }

    static func == (lhs: Chapter, rhs: Chapter) -> Bool {
        return lhs.number == rhs.number && lhs.title == rhs.title
    }
}
