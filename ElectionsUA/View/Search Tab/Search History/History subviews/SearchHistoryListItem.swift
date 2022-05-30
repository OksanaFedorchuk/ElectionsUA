//
//  SearchHistoryListItem.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 27.05.2022.
//

import SwiftUI

struct SearchHistoryListItem: View {
    
    var text: String
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 15) {
            
            Image(uiImage: R.image.myClock()!)
            Text(text)
                .font(Font(uiFont: R.font.gilroyRegular(size: 18)
                           ?? .systemFont(ofSize: 18)))
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding(.vertical, 5)
        .multilineTextAlignment(.leading)
    }
}
