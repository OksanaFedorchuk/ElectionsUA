//
//  HighlitedText.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 27.05.2022.
//

import SwiftUI

/// Text used in search tab to highlight search text in the body of search results
struct HighlitedText: View {

    @State var text: String
    @Binding var searchText: String
    var color: UIColor

    var body: some View {
        hilightedText(str: text, searched: searchText)
    }

    func hilightedText(str: String, searched: String) -> Text {

        guard !str.isEmpty && !searched.isEmpty else {
            return Text(str)
        }

        var result: Text!
        let parts = str.components(separatedBy: searched)
        for index in parts.indices {
            result = (result == nil ? Text(parts[index]) : result + Text(parts[index]))
            if index != parts.count - 1 {
                let fullText = result + Text(searched).foregroundColor(Color(color))
                result = fullText
            }
        }
        return result ?? Text(str)
    }
}
