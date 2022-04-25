//
//  TextViewRepresentable.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 24.04.2022.
//

import Foundation
import SwiftUI

struct TextViewRepresentable: UIViewRepresentable {
    
    @Binding var text: NSAttributedString
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.isEditable = false
        textView.sizeToFit()
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
    }
}
