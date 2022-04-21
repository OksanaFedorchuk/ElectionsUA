//
//  ChaptersListVM.swift
//  ВибориUA
//
//  Created by Administrator on 20.01.2022.
//

import Foundation
import SwiftUI

class ChaptersListVM: ObservableObject {

    internal let db: DBReadable

    @Published var chapters: [Chapter] = []

    init(db: DBReadable, book: String?) {
        self.db = db

        getChapters(for: book)
    }

    private func getChapters(for book: String?) {
        var chaptersFiltered: [Chapter] = []
        let objects = db.getAllObjects()
        for num in 0..<objects.count {
            let chapter = Chapter(with: objects[num])
            if !chaptersFiltered.contains(chapter) {
                chaptersFiltered.append(chapter)
            }
        }
        guard let bookStrong = book else { return chapters = chaptersFiltered }
        chapters = chaptersFiltered.filter { $0.bookNumber == "\(bookStrong)" }
    }
}
