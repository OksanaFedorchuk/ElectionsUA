//
//  PartiesDB.swift
//  ВибориUA
//
//  Created by Administrator on 29.01.2022.
//

import Foundation
import Realm
import RealmSwift

final class PartiesDB: DBReadableWriteable {
    
    // MARK: - Properties
    
    private(set) var partiesRealm: Realm?
    private let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as String
    
    // MARK: - Initialization
    
    init() {
        openReferendumLaw()
    }
    
    // MARK: - Open DB
    
    private func openReferendumLaw() {
        let realmPath = "\(path)/PartiesLaw.realm" // String = "\(path)/\(R.string.lawsTab.partiesLawRealm())"
        do {
            let config = Realm.Configuration(fileURL: URL(string: realmPath), schemaVersion: 2)
            partiesRealm = try Realm(configuration: config)
            print("MYDEBUG: selected PartiesLaw db type")
        } catch {
            print("MYDEBUG: Error opening PartiesLaw realm database: \(error.localizedDescription)")
        }
    }
}

// MARK: - READ
// MARK: - DBReadable

extension PartiesDB: DBReadable {
    func getObjectsSearched(by text: String) -> [UniversalDBModel] {
        return [UniversalDBModel]()
    }

    
    var name: String? {
        return "Партії" // R.string.lawsTab.parties()
    }
    
    func getAllObjects() -> [UniversalDBModel] {
        var objects = [PartiesLaw]()
        if let localRealm = partiesRealm {
            // Get all objects from db
            let results = localRealm.objects(PartiesLaw.self)
            print("MYDEBUG: received all president objects: \(results.count)")
            
            // transform results to objects
            results.forEach { result in
                objects.append(result)
            }
        }
        return objects
    }
    
    func getObjectsFiltered(by columnValue: String) -> [UniversalDBModel] {
        var objects = [PartiesLaw]()
        if let localRealm = partiesRealm {
            let predicate = NSPredicate(format: K.Format.chapterNum, "\(columnValue)")
            // Get all objects from db
            let results = localRealm.objects(PartiesLaw.self).filter(predicate)
            print("MYDEBUG: received chapterNum filtered president objects: \(results.count)")
            
            // transform results to objects
            results.forEach { result in
                objects.append(result)
            }
        }
        return objects
    }
    
    func getObject(with id: Int) -> UniversalDBModel {
        var article = PartiesLaw()
        if let localRealm = partiesRealm {
            article = localRealm.object(ofType: PartiesLaw.self, forPrimaryKey: id)!
        }
        return article
    }
}

// MARK: - UPDATE
// MARK: - DBWriteable

extension PartiesDB: DBWriteable {
    func toggleSaved(for articleNumber: String, currentState: Int) {
        let predicat = NSPredicate(format: K.Format.number, "\(articleNumber)")
        
        if let localRealm = partiesRealm {
            do {
                let result = localRealm.objects(PartiesLaw.self).filter(predicat)
                try localRealm.write {
                    result.first?.favourite = currentState == 0 ? 1 : 0
                }
            } catch {
                print("MYDEBUG: error updating saved for article in Parties. Error: \(error.localizedDescription)")
            }
        }
    }
}
