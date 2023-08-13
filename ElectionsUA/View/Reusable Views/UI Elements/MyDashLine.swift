//
//  MyDashLine.swift
//  ВибориUA
//
//  Created by Administrator on 20.01.2022.
//

import SwiftUI

struct MyDashLine: View {
    var colorScheme: ColorScheme
    var isHorisontal: Bool

    var body: some View {
        Line(isHorisontal: isHorisontal)
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .frame(width: isHorisontal ? nil : 1)
            .frame(height: isHorisontal ? 1 : nil)
//            .foregroundColor(colorScheme == .dark
//                             ? .white.opacity(0.3)
//                             : Color(R.color.tabGradientStart() ?? .gray).opacity(0.3))
    }
}

struct MyDashLine_Previews: PreviewProvider {
    static var previews: some View {
        MyDashLine(colorScheme: .light, isHorisontal: true)
    }
}

struct Line: Shape {
    var isHorisontal: Bool

    func path(in rect: CGRect) -> Path {

        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: isHorisontal
                     ? CGPoint(x: rect.width, y: 0)
                     : CGPoint(x: 0, y: rect.height))
        return path
    }
}
