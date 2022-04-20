//
//  ViewExtensions.swift
//  ВибориUA
//
//  Created by Administrator on 18.01.2022.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}
