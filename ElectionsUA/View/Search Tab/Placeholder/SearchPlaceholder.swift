//
//  SearchPlaceholder.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 28.05.2022.
//

import SwiftUI

struct SearchPlaceholder: View {

    var body: some View {

        VStack(spacing: 15) {
            Image(systemName: "binoculars")
                .font(.system(size: 50))
            Text("Не знаходжу результатів")
//                .font(Font(uiFont: R.font.gilroyRegular(size: 18)
//                           ?? .systemFont(ofSize: 18)))
        }
//        .foregroundColor(Color(R.color.navBarColor()!).opacity(0.4))
    }
}

struct SearchPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlaceholder()
    }
}
