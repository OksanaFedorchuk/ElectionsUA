//
//  MediaButton.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 23.04.2022.
//

import SwiftUI

struct MediaButton: View {

    enum MediaType {
        case twitter
        case facebook
        case telegram
        case instagram
        case youtube
    }
    
    let mediaType: MediaType
    let action: (() -> Void)

    var body: some View {
        Button {
            action()
        } label: {
            // stack of image+text for button
            VStack(spacing: 15) {
                switch mediaType {
                case .twitter:
                    MediaButtonImg(image: R.image.twitterIcon()!)
                    MediaButtonText(text: R.string.lawsTab.twitter())
                case .facebook:
                    MediaButtonImg(image: R.image.fbIcon()!)
                    MediaButtonText(text: R.string.lawsTab.facebook())
                case .telegram:
                    MediaButtonImg(image: R.image.telegramIcon()!)
                    MediaButtonText(text: R.string.lawsTab.telegram())
                case .instagram:
                    MediaButtonImg(image: R.image.instaIcon()!)
                    MediaButtonText(text: R.string.lawsTab.instagram())
                case .youtube:
                    MediaButtonImg(image: R.image.youTubeIcon()!)
                    MediaButtonText(text: R.string.lawsTab.youtube())
                }
            }
        }
    }
}

struct MediaButton_Previews: PreviewProvider {
    static var previews: some View {
        MediaButton(mediaType: .telegram) {
        }
    }
}
