//
//  LawGridItem.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 27.05.2022.
//

import SwiftUI


struct LawGridItem: View {

    var image: UIImage
    var textMain: String
    var textSecondary: String

    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: image)
            Text(textMain)
                .font(Font(uiFont: R.font.gilroyBold(size: 22)
                           ?? .systemFont(ofSize: 22)))
                .foregroundColor(.primary)
            Text(textSecondary)
                .font(Font(uiFont: R.font.gilroyRegular(size: 14)
                           ?? .systemFont(ofSize: 14)))
                .foregroundColor(.secondary)
        }
        .multilineTextAlignment(.leading)
    }
}
