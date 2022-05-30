//
//  BooksListVM.swift
//  ВибориUA
//
//  Created by Administrator on 20.01.2022.
//

import Foundation

class BooksListVM: ObservableObject {

    let db: DBReadable
    @Published var books: [Book] = []

    init(db: DBReadable) {
        self.db = db
        getBooks()
    }

    private func getBooks() {
        let objects = db.getAllObjects()
        for num in 0..<objects.count {
            let book = Book(with: objects[num])
            if !books.contains(book) {
                books.append(book)
            }
        }
    }
}
