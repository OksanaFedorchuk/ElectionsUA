//
//  BindedListItem.swift
//  ВибориUA
//
//  Created by Administrator on 31.01.2022.
//

import SwiftUI

struct BindedListItem: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var vm: BindedListItemVM
    
    var body: some View {
        VStack(alignment: .leading) {
            TextViewRepresentable(text: $vm.fullText)
                .foregroundColor(.primary)
                .lineSpacing(8)
                .padding(.bottom, 2)
        }
        .padding([.leading, .trailing], 15)
        .multilineTextAlignment(.leading)
    }
}
