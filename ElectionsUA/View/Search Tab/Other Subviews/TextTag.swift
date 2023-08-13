//
//  TextTag.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 24.05.2022.
//

import SwiftUI

struct TextTag: View {
    @Binding var selectedTag: String
    @State var tag: String
    var body: some View {
        Group {
            if tag == selectedTag {
                Text(tag)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
//                    .background(Color(R.color.myYellow() ?? .yellow))
            } else {
                Text(tag)
                    .padding(.vertical, 9)
                    .padding(.horizontal, 12)
//                    .background(Color(R.color.tagColor()!))
            }
        }
//        .font(Font(uiFont: R.font.gilroyBold(size: 15) ?? .systemFont(ofSize: 15)))
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}
