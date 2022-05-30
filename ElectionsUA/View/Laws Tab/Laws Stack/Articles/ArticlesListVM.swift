//
//  ArticlesListVM.swift
//  ВибориUA
//
//  Created by Administrator on 20.01.2022.
//

import Foundation

class ArticlesListVM: ObservableObject {

    internal let db: DBReadable

    @Published var articles: [Article] = []

    init(db: DBReadable, chapter: String) {
        self.db = db

        getArticlesFiltered(by: chapter)
    }

    private func getArticlesFiltered(by chapter: String) {
        let objects = db.getObjectsFiltered(by: chapter)
        for n in 0..<objects.count {
            let article = Article(with: objects[n])
            articles.append(article)
        }
    }
}
