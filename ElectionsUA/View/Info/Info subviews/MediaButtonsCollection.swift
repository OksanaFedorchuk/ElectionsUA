//
//  MediaButtonsCollection.swift
//  ElectionsUA
//
//  Created by Oksana Fedorchuk on 28.05.2022.
//

import SwiftUI

struct WebsiteButton: View {
    
    let action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 15) {
//                MediaButtonImg(image: R.image.logo()!)
                MediaButtonText(text: Strings.LawsTab.LinkText.websiteString)
            }
        }
    }
}

struct TwitterButton: View {
    
    let action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 15) {
//                MediaButtonImg(image: R.image.twitterIcon()!)
//                MediaButtonText(text: R.string.lawsTab.twitter())
            }
        }
    }
}

struct FacebookButton: View {
    
    let action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 15) {
//                MediaButtonImg(image: R.image.fbIcon()!)
//                MediaButtonText(text: R.string.lawsTab.facebook())
            }
        }
    }
}

struct TelegramButton: View {
    
    let action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 15) {
//                MediaButtonImg(image: R.image.telegramIcon()!)
//                MediaButtonText(text: R.string.lawsTab.telegram())
            }
        }
    }
}

struct InstagramButton: View {
    
    let action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 15) {
//                MediaButtonImg(image: R.image.instaIcon()!)
//                MediaButtonText(text: R.string.lawsTab.instagram())
            }
        }
    }
}

struct YouTubeButton: View {
    
    let action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 15) {
//                MediaButtonImg(image: R.image.youTubeIcon()!)
//                MediaButtonText(text: R.string.lawsTab.youtube())
            }
        }
    }
}
