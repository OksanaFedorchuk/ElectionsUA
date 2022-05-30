//
//  InfoView.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 22.04.2022.
//

import SwiftUI

// View providing information about the OPORA organization and links to its social media
struct InfoView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                // OPORA's logo
                Image(uiImage: R.image.oporA()!)
                    .resizable()
                    .scaledToFill()

                // Text about opora
                AboutOporaText()
                
                MyDashLine(colorScheme: colorScheme,
                           isHorisontal: true)
                // scrollview with media buttons opening social media
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        WebsiteButton {
                            openURL(URL(string: R.string.lawsTab.websiteLink())!)
                        }
                        FacebookButton {
                            openURL(URL(string: R.string.lawsTab.facebookLink())!)
                        }
                        TwitterButton {
                            openURL(URL(string: R.string.lawsTab.twitterLink())!)
                        }
                        TelegramButton {
                            openURL(URL(string: R.string.lawsTab.telegramLink())!)
                        }
                        InstagramButton {
                            openURL(URL(string: R.string.lawsTab.instagramLink())!)
                        }
                        YouTubeButton {
                            openURL(URL(string: R.string.lawsTab.youTubeLink())!)
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

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
