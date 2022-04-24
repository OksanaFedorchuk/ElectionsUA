//
//  InfoView.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 22.04.2022.
//

import SwiftUI

//View providing information about the OPORA organization and links to its social media
struct InfoView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                //Text about opora
                AboutOporaText()
                
                MyDashLine(colorScheme: colorScheme,
                           isHorisontal: true)
                //scrollview with media buttons opening social media
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        MediaButton(mediaType: .facebook) {
                            openURL(URL(string: R.string.lawsTab.facebookLink())!)
                        }
                        MediaButton(mediaType: .twitter) {
                            openURL(URL(string: R.string.lawsTab.twitterLink())!)
                        }
                        MediaButton(mediaType: .telegram) {
                            openURL(URL(string: R.string.lawsTab.telegramLink())!)
                        }
                        MediaButton(mediaType: .instagram) {
                            openURL(URL(string: R.string.lawsTab.instagramLink())!)
                        }
                        MediaButton(mediaType: .youtube) {
                            openURL(URL(string: R.string.lawsTab.youTubeLink())!)
                        }
                    }
                }
                .padding(.top, 30)
            }
            .padding(.horizontal, 24)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
