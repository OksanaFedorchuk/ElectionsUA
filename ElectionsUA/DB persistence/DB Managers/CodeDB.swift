//
//  CodeDB.swift
//  ВибориUA
//
//  Created by Administrator on 29.01.2022.
//

import Foundation
import Realm
import RealmSwift

final class CodeDB: DBReadableWriteable {

    // MARK: - Properties

    private(set) var codeRealm: Realm?
    private let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as String

    // MARK: - Initialization

    init() {
        openElectoralCode()
    }

    // MARK: - Open DB

    private func openElectoralCode() {
        let realmPath: String = "\(path)/\(R.string.lawsTab.electoralCodeRealm())"
        do {
            let config = Realm.Configuration(fileURL: URL(string: realmPath), schemaVersion: 2)
            codeRealm = try Realm(configuration: config)
            print("MYDEBUG: selected ElectoralCode db type")
        } catch {
            print("MYDEBUG: Error opening ElectoralCode realm database: \(error.localizedDescription)")
        }
    }
}

// MARK: - READ
// MARK: - DBReadable
extension CodeDB: DBReadable {
    var name: String? {
        return nil
    }

    func getAllObjects() -> [UniversalDBModel] {
        var objects = [ElectoralCode]()
        if let localRealm = codeRealm {
            // Get all objects from db
            let results = localRealm.objects(ElectoralCode.self)
            print("MYDEBUG: received all code objects: \(results.count)")

            // transform results to objects
            results.forEach { result in
                objects.append(result)
            }
        }
        return objects
    }

    func getObjectsFiltered(by columnValue: String) -> [UniversalDBModel] {
        var objects = [ElectoralCode]()
        if let localRealm = codeRealm {
            let predicate = NSPredicate(format: K.Format.chapterNum, "\(columnValue)")
            // Get all objects from db
            let results = localRealm.objects(ElectoralCode.self).filter(predicate)
            print("MYDEBUG: received code chapterNum filtered objects: \(results.count)")

            // transform results to objects
            results.forEach { result in
                objects.append(result)
            }
        }
        return objects
    }

    func getObject(with id: Int) -> UniversalDBModel {
        var article = ElectoralCode()
        if let localRealm = codeRealm {
            article = localRealm.object(ofType: ElectoralCode.self, forPrimaryKey: id)!
        }
        return article
    }
}

// MARK: - UPDATE
// MARK: - DBWriteable

extension CodeDB: DBWriteable {
    func toggleSaved(for articleNumber: String, currentState: Int) {
        let predicat = NSPredicate(format: K.Format.number, "\(articleNumber)")

        if let localRealm = codeRealm {
            do {
                let result = localRealm.objects(ElectoralCode.self).filter(predicat)
                try localRealm.write {
                    result.first?.favourite = currentState == 0 ? 1 : 0
                }
            } catch {
                print("MYDEBUG: error updating saved for article in Code. Error: \(error.localizedDescription)")
            }
        }
    }
}
