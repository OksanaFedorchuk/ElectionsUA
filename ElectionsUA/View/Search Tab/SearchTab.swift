//
//  SearchTab.swift
//  ВибориUA
//
//  Created by Oksana Fedorchuk on 05.10.2021.
//

import SwiftUI

struct SearchTab: View {

    @ObservedObject var vm: SearchTabVM
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack {
                CustomSearchTextField(searchText: $vm.searchText,
                                      colorScheme: colorScheme)
                .padding(.vertical)
                switch vm.state {
                case .start:
                    SearchHistoryView()
                    PopularSearchView()

                case .hasResults:
                    HTagCollection(selectedTag: $vm.selectedTag, tags: vm.tags)
                    Spacer()
                    LazyVStack(alignment: .leading) {
                        ForEach(vm.searchResults) { article in
                            ListItem(textMain: "\(article.number)",
                                     textSecondary: "\(article.title)")
                        }
                    }

                case .noResults:
                    // TODO: Show placeholder
                    Text("No results")
                }
                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

struct SearchTab_Previews: PreviewProvider {
    static var previews: some View {
        SearchTab(vm: SearchTabVM(db: NardepyDB()))
    }
}
