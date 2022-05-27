//
//  SearchHistoryVM.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 26.05.2022.
//

import SwiftUI

class SearchHistoryVM: ObservableObject {

    @Published var searchedItems: [String] = ["Вибори", "Вибори депутатів", "Референдум"]

}
