//
//  DBCopyAssistant.swift
//  ВибориUA
//
//  Created by Administrator on 27.01.2022.
//

import Foundation

// assistant allows to copy database files to filemanager on device(for read/write)
final class DBCopyAssistant {

    // MARK: - Singleton

    static let shared = DBCopyAssistant()

    // MARK: - Properties

    private let fileManager = FileManager.default
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    // all names of databases used in the app
    private let dbNames = ["ElectoralCode.realm", "NardepyLaw.realm", "ReferendumLaw.realm", "PartiesLaw.realm"]//[R.string.lawsTab.electoralCodeRealm(), R.string.lawsTab.nardepyLawRealm(),
//                           R.string.lawsTab.referendumLawRealm(), R.string.lawsTab.partiesLawRealm()]
    private var dbPaths = [String]()
    
    // MARK: - Initialization

    init() {
        self.makeDBPaths()
    }

    // MARK: - Private methods

    private func makeDBPaths() {
//        guard let codePath = Bundle.main.path(forResource: R.string.lawsTab.electoralCode(),
//                                              ofType: R.string.lawsTab.realm()) else {
//            return
//        }
//        guard let nardepyPath = Bundle.main.path(forResource: R.string.lawsTab.nardepyLaw(),
//                                                 ofType: R.string.lawsTab.realm()) else {
//            return
//        }
//        guard let referendumPath = Bundle.main.path(forResource: R.string.lawsTab.referendumLaw(),
//                                                    ofType: R.string.lawsTab.realm()) else {
//            return
//        }
//        guard let presidentPath = Bundle.main.path(forResource: R.string.lawsTab.partiesLaw(),
//                                                   ofType: R.string.lawsTab.realm()) else {
//            return
//        }
        guard let codePath = Bundle.main.path(forResource: "ElectoralCode", ofType: "realm") else {return}
        guard let nardepyPath = Bundle.main.path(forResource: "NardepyLaw", ofType: "realm") else {return}
        guard let referendumPath = Bundle.main.path(forResource: "ReferendumLaw", ofType: "realm") else {return}
        guard let presidentPath = Bundle.main.path(forResource: "PartiesLaw", ofType: "realm") else {return}
        
        var paths = [String]()
        paths.append(contentsOf: [codePath, nardepyPath, referendumPath, presidentPath])
        self.dbPaths = paths
    }

    // MARK: - Main shared method for copying databases

    internal func copyDBsToFilemanager() {

        for num in dbNames.indices {
            if fileManager.fileExists(atPath: dbPaths[num]) {
                let sourceUrl = URL(fileURLWithPath: dbPaths[num])
                let destination = documentsDirectory.appendingPathComponent("\(dbNames[num])", isDirectory: false)
                try? fileManager.copyItem(at: sourceUrl, to: destination)
                
                if fileManager.fileExists(atPath: destination.path) {
                    print("MYDEBUG: copied \(dbNames[num])")
                } else {
                    print("MYDEBUG: failed copying \(dbNames[num])")
                }
            }
        }
    }
}
