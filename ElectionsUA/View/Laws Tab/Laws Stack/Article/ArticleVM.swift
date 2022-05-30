//
//  ArticleVM.swift
//  ВибориUA
//
//  Created by Administrator on 21.01.2022.
//

import Foundation
import Combine

class ArticleVM: ObservableObject {

    // MARK: - Published Properties

    @Published var currentID: Int?
    @Published var article = Article()
    @Published var isSaved: Bool = false
    @Published var maxArticles: Int = 0

    // MARK: - Private Properties

    private let db: DBReadableWriteable
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initialization

    init(db: DBReadableWriteable,
         articleSelected: Int?) {
        self.db = db
        // receiving the selected article from the database
        if let id = articleSelected {
            currentID = id
        }
        subscribeID()
        self.subscribeIsSaved()
        self.subscribeSaving()
        self.getMax()
        print("MYDEBUG: maxArticles: \(maxArticles)")
    }

    // MARK: - subscriptions

    private func subscribeID() {
        $currentID.sink { id in
            guard let strongID = id else {return}
            self.getArticle(with: strongID)
        }
        .store(in: &cancellables)
    }

    // function subscribing the isSaved property to the favorite state of the given article
    private func subscribeIsSaved() {
        $article
            .map { $0.favourite }
            .map { favorite -> Bool in
                switch favorite {
                case 0 :
                    return false
                case 1 :
                    return true
                default:
                    print("MYDEBUG: Error: Some other favorite status")
                    return false
                }
            }
            .assign(to: \.isSaved, on: self)
            .store(in: &cancellables)
    }

    //    subscription to the isSaved property, changing the favorite state of the given article in database
    func subscribeSaving() {
        $isSaved
        // dropping the first value received from db, before the property is toggled by button
            .dropFirst()
            .sink { [weak self] saved in
                switch saved {
                case true :
                    self?.db.toggleSaved(for: self?.article.number ?? "", currentState: 0)
                case false :
                    self?.db.toggleSaved(for: self?.article.number ?? "", currentState: 1)
                }
            }
            .store(in: &cancellables)
    }

    // MARK: - Private methods

    private func getArticle(with id: Int) {
        let object = db.getObject(with: id)
        article = Article(with: object)
    }

    private func getMax() {
        let objects = db.getAllObjects()
        maxArticles = objects.count
    }

    internal func setNext() {
        guard let currentID = self.currentID else {return}
        if currentID < maxArticles {
            self.currentID! += 1
        }
    }

    internal func setPrevious() {
        guard let currentID = self.currentID else {return}
        if currentID <= maxArticles && currentID > 0 {
            self.currentID! -= 1
        }
    }
}
