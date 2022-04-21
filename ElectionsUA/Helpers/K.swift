//
//  K.swift
//  VYBORY
//
//  Created by Oksana Fedorchuk on 13.01.2021.
//

import Foundation
import SwiftUI

struct K {

    // MARK: - Colors, Images
    struct Colors {

        static let myBackground = Color("myBackground")
        static let myYellow = Color("myYellow")
        static let tabGradientEnd = Color("tabGradientEnd")
        static let tabGradientStart = Color("tabGradientStart")
        static let navBarColorUI = UIColor(named: "navBarColor")!
        static let navBarColor = Color("navBarColor")
    }

    struct IconsTabBar {
        static let savedTab = "flagTab"
        static let lawTab = "lawTab"
        static let protocolTab = "protocolTab"
        static let searchTab = "searchTab"
    }

    struct IconsNavBar {
        static let flag = "flag"
        static let flagSelected = "flagSelected"
        static let info = "info"
    }

    struct LawBacks {
        static let firstLaw = "1law"
        static let secondLaw = "2law"
        static let thirdLaw = "3law"
        static let fourthLaw = "4law"
    }

    struct Image {
        static let BookImages = ["01_book_01", "01_book_02", "01_book_03", "01_book_04"]
    }

    // MARK: - Database
    struct Database {

        static let NilItem = "Виключена."

        struct Table {
            static let Books = "books"
            static let Chapters = "chapters"
            static let Articles = "articles"
        }

        struct Row {
            static let Title = "title"
            static let Number = "number"
            static let Content = "content"
            static let Favourite = "favourite"
            static let ChapterNumber = "chapter_number"
            static let BookNumber = "book_number"
        }
    }
    // MARK: - Placeholder
    struct Placeholder {

        struct Image {
            static let Dog = "dog_1"
            static let DogCry = "dog_2"
        }

        struct Text {
            static let Protocols = "ПРОТОКОЛИ В РОЗРОБЦІ"
            static let FindSomething = "ЩОСЬ ЗНАЙТИ?"
            static let NothingFound = "НІЧОГО НЕ ЗНАЙДЕНО"
        }
    }
    
    // MARK: - AboutUs
    struct AboutUsText {

        struct URLs {
            struct SocialMedia {
                static let Facebook = URL(string: "https://www.facebook.com/cn.opora")
                static let Twitter = URL(string: "https://twitter.com/opora")
                static let Telegram = URL(string: "https://t.me/opora_news")
                static let Instagram = URL(string: "https://www.instagram.com/cn.opora/")
                static let YouTube = URL(string: "https://www.youtube.com/user/oporavideo")
            }

            struct Platforms {
                static let Website = URL(string: "https://oporaua.org/")!
                static let Map = URL(string: "https://oporaua.org/map-reports")!
                static let Dani = URL(string: "https://danivyboriv.net/")!
                static let Analizator = URL(string: "https://fb.oporaua.org/")!
            }
        }

        struct Text {

            static let WebsiteLinkString = "Вебсайт \n"
            static let MapLinkString = "Мапа порушень \n"
            static let DaniLinkString = "Все про виборчі дані та соцмережі \n"
            static let AnalizatorLinkString = "Аналізатор політичної реклами \n \n"

//            static let String1 = ""
            static let String2 = "І не забувайте стежити за нами в соціальних мережах:"
        }
    }
}
