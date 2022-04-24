//
//  StateManager.swift
//  ВибориUA
//
//  Created by Administrator on 03.02.2022.
//

import SwiftUI

class StateManager: ObservableObject {

    // home tab
    @Published var selection: String?
    @Published var showingInfo: Bool = false

    // books
    @Published var currentBook: String?
    @Published var showingChapter: Bool = false

    // chapters
    @Published var currentChapter: String?
    @Published var showingArticles: Bool = false

    // articles
    @Published var currentArticle: Int?
    @Published var showingArticle: Bool = false

    // article
    //    @Published var currentID: Int?
}
