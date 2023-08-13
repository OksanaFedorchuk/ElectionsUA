//
//  MediaButtonText.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 24.04.2022.
//

import SwiftUI

struct MediaButtonText: View {
    
    @State var text: String
    
    var body: some View {
        Text(text)
//            .font(Font(uiFont: R.font.gilroyRegular(size: 14)
//                       ?? .systemFont(ofSize: 14)))
            .foregroundColor(.black.opacity(0.6))
    }
}
