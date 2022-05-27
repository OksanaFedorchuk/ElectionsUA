//
//  DBProtocols.swift
//  ВибориUA
//
//  Created by Administrator on 29.01.2022.
//

import Foundation

protocol DBReadableWriteable: DBReadable, DBWriteable, DBSerchable {}

protocol DBReadable {
    var name: String? { get }

    func getAllObjects() -> [UniversalDBModel]
    func getObjectsFiltered(by columnValue: String) -> [UniversalDBModel]
    func getObject(with id: Int) -> UniversalDBModel
    func getObjectsSearched(by text: String) -> [UniversalDBModel] 
}

protocol DBWriteable {
    func toggleSaved(for articleNumber: String, currentState: Int)
}

protocol DBSerchable {
}
