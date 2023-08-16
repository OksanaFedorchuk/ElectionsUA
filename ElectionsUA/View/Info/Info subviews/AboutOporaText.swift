//
//  AboutOporaText.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 23.04.2022.
//

import SwiftUI

struct AboutOporaText: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack {
            Text(Strings.LawsTab.About.title)
//                .font(Font(uiFont: R.font.gilroyBold(size: 20)
//                           ?? .systemFont(ofSize: 20)))
            +
            Text(Strings.LawsTab.About.body)
//                .font(Font(uiFont: R.font.gilroyRegular(size: 20)
//                           ?? .systemFont(ofSize: 18)))
        }
    }
}

struct AboutOporaText_Previews: PreviewProvider {
    static var previews: some View {
        AboutOporaText()
    }
}
