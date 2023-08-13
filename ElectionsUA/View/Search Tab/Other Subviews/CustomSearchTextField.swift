//
//  CustomSearchTextField.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 27.04.2022.
//

import SwiftUI
import Combine

struct CustomSearchTextField: View {

    @Binding var searchText: String
    @State var colorScheme: ColorScheme

    var cancellables = Set<AnyCancellable>()

    var body: some View {
        HStack(alignment: .center) {
//            Image(uiImage: R.image.search()
//                  ?? UIImage(systemName: "magnifyingglass")
//                  ?? UIImage())
//                .opacity(searchText.isEmpty ? 0.3 : 1)
            TextField("", text: $searchText)
                .placeholder(when: searchText.isEmpty) {
                    Text("Search...")
                }
                .modifier(ClearButtonModifier(text: $searchText))
        }
        .modifier(SearchTextFieldModifier(colorScheme: colorScheme))
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchTextField(searchText: .constant(""), colorScheme: .light)
    }
}
