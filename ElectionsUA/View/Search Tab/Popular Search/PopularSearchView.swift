//
//  PopularSearchView.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 26.05.2022.
//

import SwiftUI

struct PopularSearchView: View {
    
    @ObservedObject var vm = PopularSearchVM()
    
    var body: some View {
        
        GeometryReader { reader in
            VStack(alignment: .leading) {
                Text("Популярні пошуки")
//                    .font(Font(uiFont: R.font.gilroyBold(size: 22)
//                               ?? .systemFont(ofSize: 22)))
                    .foregroundColor(.primary)
                
                TagsView(availableWidth: reader.size.width,
                         data: vm.tags,
                         spacing: 15,
                         alignment: .leading) { tag in
                    
                    TagItemView(text: tag)
                }
            }
        }
    }
}

struct PopularSearch_Previews: PreviewProvider {
    static var previews: some View {
        PopularSearchView()
    }
}
