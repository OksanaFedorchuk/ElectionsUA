//
//
//  PartiesLaw.swift
//  ВибориUA
//
//  Created by Administrator on 27.01.2022.
//

import Foundation
import RealmSwift

class PartiesLaw: Object, ObjectKeyIdentifiable, UniversalDBModel {

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
