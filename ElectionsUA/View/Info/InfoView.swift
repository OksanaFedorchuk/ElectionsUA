//
//  InfoView.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 22.04.2022.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ScrollView {
            VStack {
                Image(Asset.Assets.logoOPORA.name)
                    .resizable()
                    .scaledToFill()
                
                aboutOporaText
                
                MyDashLine(colorScheme: colorScheme,
                           isHorisontal: true)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        WebsiteButton {
                            openURL(URL(string: Strings.LawsTab.Link.website)!)
                        }
                        FacebookButton {
                            openURL(URL(string: Strings.LawsTab.Link.facebook)!)
                        }
                        TwitterButton {
                            openURL(URL(string: Strings.LawsTab.Link.twitter)!)
                        }
                        TelegramButton {
                            openURL(URL(string: Strings.LawsTab.Link.telegram)!)
                        }
                        InstagramButton {
                            openURL(URL(string: Strings.LawsTab.Link.instagram)!)
                        }
                        YouTubeButton {
                            openURL(URL(string: Strings.LawsTab.Link.youTube)!)
                        }
                    }
                }
                .padding(.top, 30)
            }
            .padding(.horizontal, 24)
        }
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - aboutOporaText
private extension InfoView {
    var aboutOporaText: some View {
        VStack {
            Text(Strings.LawsTab.About.title)
                .font(FontFamily.Gilroy.regular.textStyle(.title))
                .fontWeight(.bold)
                .foregroundColor(colorScheme == .light ? .black : .white)
            +
            Text(Strings.LawsTab.About.body)
                .font(FontFamily.Gilroy.regular.textStyle(.body))
                .foregroundColor(
                    colorScheme == .light
                    ? .black.opacity(0.6)
                    : .white.opacity(0.7)
                )
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
