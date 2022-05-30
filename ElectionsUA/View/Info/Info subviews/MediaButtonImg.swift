//
//  MediaButtonImg.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 24.04.2022.
//

import SwiftUI

struct MediaButtonImg: View {
    
    @State var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .frame(width: 53, height: 53)
    }
}
