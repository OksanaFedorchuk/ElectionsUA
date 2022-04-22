//
//  FontExtensions.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 23.04.2022.
//

import SwiftUI

extension Font {
    
    init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
}
