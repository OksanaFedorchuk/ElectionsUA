//
//  TagItemView.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 28.05.2022.
//

import SwiftUI

struct TagItemView: View {

    @State var text: String

    var body: some View {

        Text(text)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
//            .background(Color(R.color.myGray()!))
            .foregroundColor(.black.opacity(0.4))
//            .font(Font(uiFont: R.font.gilroyRegular(size: 15)!))
            .lineLimit(1)
            .cornerRadius(12)
    }
}
