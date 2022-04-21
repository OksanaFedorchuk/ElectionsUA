//
//  NardepyLawModel.swift
//  ВибориUA
//
//  Created by Administrator on 23.01.2022.
//

import Foundation
import RealmSwift

protocol UniversalDBModel {
    var articleID: Int { get set }
    var number: String { get set }
    var title: String { get set }
    var content: String { get set }
    var favourite: Int { get set }
    var lawTitle: String { get set }
    var bookNum: String { get set }
    var bookTitle: String { get set }
    var chapterNum: String { get set }
    var chapterTitle: String { get set }
}

class NardepyLaw: Object, ObjectKeyIdentifiable, UniversalDBModel {

    @Persisted(primaryKey: true) var articleID: Int = 0
    @Persisted var number = ""
    @Persisted var title = ""
    @Persisted var content = ""
    @Persisted var favourite = 0
    @Persisted var lawTitle = ""
    @Persisted var bookNum = ""
    @Persisted var bookTitle = ""
    @Persisted var chapterNum = ""
    @Persisted var chapterTitle = ""
}
