//
//  Book.swift
//  VYBORY
//
//  Created by Oksana Fedorchuk on 13.01.2021.
//

import Foundation

class Book: Hashable {
    
    var number: String
    var title: String
    
    init(number: String, title: String) {
        self.number = number
        self.title = title
    }
    
    init(with model: UniversalDBModel) {
        self.number = model.bookNum
        self.title = model.bookTitle
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.number == rhs.number && lhs.title == rhs.title
    }
}
