//
//  LawsHTagCollection.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 27.04.2022.
//

import SwiftUI

struct HTagCollection: View {

    @Binding var selectedTag: String
    @State var tags: [String]

    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            HStack(spacing: 20) {
                ForEach(tags, id: \.self) { tag in
                    TextTag(selectedTag: $selectedTag, tag: tag)
                        .onTapGesture {
                            self.selectedTag = tag
                        }
                }
            }
        }
    }
}

struct LawsHTagCollection_Previews: PreviewProvider {
    static var previews: some View {
        HTagCollection(selectedTag: .constant("Law2"), tags: ["Law1", "Law2", "All"])
    }
}
