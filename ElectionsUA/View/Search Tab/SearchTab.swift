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
                        .padding(.bottom, 5)
                    Spacer()
                    LazyVStack(alignment: .leading) {
                        ForEach(vm.searchResults) { article in
                            SearchListItem(textMain: "\(article.number)",
                                           textSecondary: "\(article.title)\n\(article.content)",
                                           searchText: $vm.searchText)
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
            .preferredColorScheme(.light)
    }
}

struct SearchTab_Previews_Dark: PreviewProvider {
    static var previews: some View {
        SearchTab(vm: SearchTabVM(db: NardepyDB()))
            .preferredColorScheme(.dark)
    }
}
