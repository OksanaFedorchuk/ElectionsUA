//
//  AboutOporaText.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 23.04.2022.
//

import SwiftUI

struct AboutOporaText: View {

    var body: some View {

        Text(R.string.lawsTab.aboutOPORA())
            .font(Font(uiFont: R.font.gilroyBold(size: 20)
                       ?? .systemFont(ofSize: 20)))
        +
        Text(R.string.lawsTab.aboutOPORAText())
            .font(Font(uiFont: R.font.gilroyRegular(size: 20)
                       ?? .systemFont(ofSize: 18)))
    }
}

struct AboutOporaText_Previews: PreviewProvider {
    static var previews: some View {
        AboutOporaText()
    }
}
