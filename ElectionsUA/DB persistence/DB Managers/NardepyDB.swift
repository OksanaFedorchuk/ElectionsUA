//
//  NardepyDB.swift
//  ВибориUA
//
//  Created by Administrator on 28.01.2022.
//

import Foundation
import Realm
import RealmSwift

class NardepyDB: DBReadableWriteable {

    // MARK: - Properties

    private(set) var nardepyRealm: Realm?
    private let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as String

    // MARK: - Initialization

    init() {
        openNardepyLaw()
    }

    // MARK: - Open DB

    private func openNardepyLaw() {
        let realmPath: String = "\(path)/NardepyLaw.realm"
        do {
            let config = Realm.Configuration(fileURL: URL(string: realmPath), schemaVersion: 1)
            nardepyRealm = try Realm(configuration: config)
            print("MYDEBUG: selected NardepyLaw db type")
        } catch {
            print("MYDEBUG: Error opening NardepyLaw realm database: \(error.localizedDescription)")
        }
    }
}

// MARK: - READ
// MARK: - DBReadable

extension NardepyDB: DBReadable {
    var name: String? {
        return "Депутати"
    }

    // MARK: - get all objects
    func getAllObjects() -> [UniversalDBModel] {
        var objects = [NardepyLaw]()
        if let localRealm = nardepyRealm {
            // Get all objects from db
            let results = localRealm.objects(NardepyLaw.self)
            print("MYDEBUG: received all deputies objects objects: \(results.count)")

            // transform results to objects
            results.forEach { result in
                objects.append(result)
            }
        }
        return objects
    }

    // MARK: - get articles for the chapter
    //    filter objects receiving articles with chapterNum column values matching the given string
    func getObjectsFiltered(by columnValue: String) -> [UniversalDBModel] {
        var objects = [NardepyLaw]()
        if let localRealm = nardepyRealm {
            let predicate = NSPredicate.init(format: "chapterNum == %@", "\(columnValue)")
            // Get all objects from db
            let results = localRealm.objects(NardepyLaw.self).filter(predicate)
            print("MYDEBUG: received all chapterNum filtered deputies objects: \(results.count)")

            // transform results to objects
            results.forEach { result in
                objects.append(result)
            }
        }
        return objects
    }

    // MARK: - Get the Article using its number

    func getObject(with id: Int) -> UniversalDBModel {
        var article = NardepyLaw()
        if let localRealm = nardepyRealm {
            article = localRealm.object(ofType: NardepyLaw.self, forPrimaryKey: id)!
        }
        return article
    }
}

// MARK: - UPDATE
// MARK: - DBWriteable

extension NardepyDB: DBWriteable {
    func toggleSaved(for articleNumber: String, currentState: Int) {
        let predicat = NSPredicate.init(format: "number == %@", "\(articleNumber)")

        if let localRealm = nardepyRealm {
            do {
                let result = localRealm.objects(NardepyLaw.self).filter(predicat)
                try localRealm.write {
                    result.first?.favourite = currentState == 0 ? 1 : 0
                }
            } catch {
                print("MYDEBUG: error updating saved for article in Nardepy. Error: \(error.localizedDescription)")
            }
        }
    }
}

extension NardepyDB: DBSerchable {}
