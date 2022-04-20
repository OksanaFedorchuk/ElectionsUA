//
//  VyboryFonts.swift
//  ВибориUA
//
//  Created by Oksana Fedorchuk on 06.12.2021.
//

import SwiftUI
import CoreText

enum VyboryFonts: String {
    
    case robotoBold = "Roboto-Bold"
    
    case gilroyRegular = "Gilroy-Regular"
    case gilroyMedium = "Gilroy-Medium"
    case gilroySemibold = "Gilroy-SemiBold"
    case gilroyBold = "Gilroy-Bold"
    
    func of(size: CGFloat) -> Font {
        return .custom (self.rawValue, size: size)
    }
}
