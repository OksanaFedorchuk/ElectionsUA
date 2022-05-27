//
//  SearchTabVM.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 27.04.2022.
//

import SwiftUI
import Combine

/// Search Tab has states:
/// empty(when no history or popular search yet),
/// no results(when no search results found) ,
/// has history(history list),
/// has popular(popular list),
/// has results(list of results+corresponding tags)
enum SearchState: String {
    case start
    case noResults
    case hasResults
}

protocol SearchVM: ObservableObject {
    associatedtype SearchStateValue: RawRepresentable where SearchStateValue.RawValue: StringProtocol

    var selectedTag: String { get set }
    var tags: [String] { get set }

    var searchText: String { get set }
    var searchResults: [Article] { get set }

    func getResultsBySearchText()
    func filterByTag()
}

final class SearchTabVM: SearchVM {
    typealias SearchStateValue = SearchState

    internal let db: DBReadable

    // Properties for tags
    @Published var selectedTag = "Всі"
    @Published var tags = ["Всі", "Нардепи", "Референдум", "Виборчий Кодекс", "Партії"]

    // Properties for search logic
    @Published var searchText = ""
    @Published var searchResults = [Article]()

    var cancellables = Set<AnyCancellable>()
    var state = SearchStateValue.start

    init(db: DBReadable) {
        self.db = db

        getResultsBySearchText()
        filterByTag()
        provideState()
    }

    func getResultsBySearchText() {
        $searchText
            .sink { [self] text in

                self.searchResults = []
                let objects = self.db.getObjectsSearched(by: text)
                for num in 0..<objects.count {
                    let article = Article(with: objects[num])
                    self.searchResults.append(article)
                }
                // TODO: Update the tags available based on search results
            }
            .store(in: &cancellables)
    }

    func filterByTag() {
        $selectedTag
            .sink { tag in
                // filter search results by tag {tag == article.lawType}
                // searchResults.filter {}
                print(tag)
            }
            .store(in: &cancellables)
    }

    func provideState() {
        $searchResults
            .sink { articles in
                if articles.isEmpty && self.searchText != "" {
                    self.state = .noResults
                } else if articles.isEmpty && self.searchText == "" {
                    self.state = .start
                } else {
                    self.state = .hasResults
                }
            }
            .store(in: &cancellables)
    }
}
