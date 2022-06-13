//
//  ProtocolVM.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 30.05.2022.
//

import SwiftUI
import Combine

struct Field: Hashable {

    let id: Int
    let title: String
    var input: String
    var error: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

class ProtocolVM: ObservableObject {

    @Published var inputs = [String]()

    @Published var fields = [Field]()

    var cancellables = Set<AnyCancellable>()

    init() {
        loadData()
        subscribeInputs()
    }

    private func loadData() {
        
        let titles = [R.string.protocolTab.totalBallotsReceived(),
                      R.string.protocolTab.totalBallotsUnused(),
                      R.string.protocolTab.totalVotersEnlisted(),
                      R.string.protocolTab.totalVotersAtHome(),
                      R.string.protocolTab.totalVotersReceivedBallotsAtPrecinct(),
                      R.string.protocolTab.totalVotersReceivedBallotsAtHome(),
                      R.string.protocolTab.totalVotersReceivedBallots(),
                      R.string.protocolTab.totalBallotsNotIncluded(),
                      R.string.protocolTab.totalVotersVotedAtPrecincts(),
                      R.string.protocolTab.totalBallotsUnvalid(),
                      R.string.protocolTab.candidate1(),
                      R.string.protocolTab.candidate2()]

        for num in titles.indices {
            let field = Field(id: num, title: titles[num], input: "", error: "No")
            fields.append(field)
        }
        inputs = Array(repeating: "", count: titles.count)
    }

    private func subscribeInputs() {
        $inputs
            .sink { [weak self] myinputs in
                for index in myinputs.indices {
                    self?.fields[index].error = myinputs[index]
                }
            }
            .store(in: &cancellables)
    }
}
