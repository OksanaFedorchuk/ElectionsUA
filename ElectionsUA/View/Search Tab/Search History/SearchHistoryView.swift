//
//  SearchHistoryView.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 26.05.2022.
//

import SwiftUI

struct SearchHistoryView: View {
    
    @ObservedObject var vm = SearchHistoryVM()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Історія пошуку")
                .font(Font(uiFont: R.font.gilroyBold(size: 22)
                           ?? .systemFont(ofSize: 22)))
                .foregroundColor(.primary)
            ForEach(vm.searchedItems, id: \.self) { text in
                SearchHistoryListItem(text: text)
            }
        }
    }
}

struct SearchHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistoryView(vm: SearchHistoryVM())
            .preferredColorScheme(.light)
    }
}

struct SearchHistoryView_Previews_Dark: PreviewProvider {
    static var previews: some View {
        SearchHistoryView(vm: SearchHistoryVM())
            .preferredColorScheme(.dark)
    }
}
