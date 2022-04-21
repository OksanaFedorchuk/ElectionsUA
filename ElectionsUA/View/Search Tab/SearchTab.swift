//
//  SearchTab.swift
//  ВибориUA
//
//  Created by Oksana Fedorchuk on 05.10.2021.
//

import SwiftUI

struct SearchTab: View {

    var body: some View {
        VStack {
            Spacer()
            Text(R.string.lawsTab.searchTabTitle())
            Spacer()
        }
    }
}

struct SearchTab_Previews: PreviewProvider {
    static var previews: some View {
        SearchTab()
    }
}
