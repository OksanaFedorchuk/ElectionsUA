//
//  ReferendumDB.swift
//  ВибориUA
//
//  Created by Administrator on 29.01.2022.
//

import Foundation
import Realm
import RealmSwift

final class ReferendumDB: DBReadableWriteable {
    
    //MARK: - Properties
    
    private(set) var referendumRealm: Realm?
    private let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as String
    
    //MARK: - Initialization
    
    init() {
        openReferendumLaw()
    }
    
    //MARK: - Open DB
    
    private func openReferendumLaw() {
        let realmPath: String = "\(path)/ReferendumLaw.realm"
        do {
            let config = Realm.Configuration(fileURL: URL(string: realmPath), schemaVersion: 1)
            referendumRealm = try Realm(configuration: config)
            print("MYDEBUG: selected ReferendumLaw db type")
        }
        catch {
            print("MYDEBUG: Error opening ReferendumLaw realm database: \(error.localizedDescription)")
        }
    }
}

//MARK: - READ
//MARK: - DBReadable

extension ReferendumDB: DBReadable {
    var name: String? {
        return "Референдум"
    }
    
    func getAllObjects() -> [UniversalDBModel] {
        var objects = [ReferendumLaw]()
        if let localRealm = referendumRealm {
            //Get all objects from db
            let results = localRealm.objects(ReferendumLaw.self)
            print("MYDEBUG: received all referendum objects: \(results.count)")
            
            //transform results to objects
            results.forEach { result in
                objects.append(result)
            }
        }
        return objects
    }
    
    func getObjectsFiltered(by columnValue: String) -> [UniversalDBModel] {
        var objects = [ReferendumLaw]()
        if let localRealm = referendumRealm {
            let predicate = NSPredicate.init(format: "chapterNum == %@", "\(columnValue)")
            //Get all objects from db
            let results = localRealm.objects(ReferendumLaw.self).filter(predicate)
            print("MYDEBUG: received chapterNum filtered referendum objects: \(results.count)")
            
            //transform results to objects
            results.forEach { result in
                objects.append(result)
            }
        }
        return objects
    }
    
    func getObject(with id: Int) -> UniversalDBModel {
        var article = ReferendumLaw()
        if let localRealm = referendumRealm {
            article = localRealm.object(ofType: ReferendumLaw.self, forPrimaryKey: id)!
        }
        return article
    }
}

//MARK: - UPDATE
//MARK: - DBWriteable

extension ReferendumDB: DBWriteable {
    func toggleSaved(for articleNumber: String, currentState: Int) {
        let predicat = NSPredicate.init(format: "number == %@", "\(articleNumber)")
        
        if let localRealm = referendumRealm {
            do {
                let result = localRealm.objects(ReferendumLaw.self).filter(predicat)
                try localRealm.write {
                    result.first?.favourite = currentState == 0 ? 1 : 0
                }
            }
            catch {
                print("MYDEBUG: error updating new saved status for the selected article in Nardepy. Error: \(error.localizedDescription)")
            }
        }
    }
}
