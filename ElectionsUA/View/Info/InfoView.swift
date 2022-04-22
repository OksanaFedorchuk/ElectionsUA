//
//  InfoView.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 22.04.2022.
//

import SwiftUI

struct InfoView: View {

    @Environment(\.colorScheme) var colorScheme

    var body: some View {

        ScrollView {

            VStack {
                AboutOporaText()
                MyDashLine(colorScheme: colorScheme,
                           isHorisontal: true)
                HStack {
                    //social media icons
                }
            }
            .padding()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
