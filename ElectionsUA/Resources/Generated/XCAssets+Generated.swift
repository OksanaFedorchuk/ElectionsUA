// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI
#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.SystemColor", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.SystemColor
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let bglawFour = ImageAsset(name: "bglawFour")
    internal static let bglawOne = ImageAsset(name: "bglawOne")
    internal static let bglawThree = ImageAsset(name: "bglawThree")
    internal static let bglawTwo = ImageAsset(name: "bglawTwo")
    internal static let iconFb = ImageAsset(name: "iconFb")
    internal static let iconFlag = ImageAsset(name: "iconFlag")
    internal static let iconFlagSelected = ImageAsset(name: "iconFlagSelected")
    internal static let iconInfo = ImageAsset(name: "iconInfo")
    internal static let iconInsta = ImageAsset(name: "iconInsta")
    internal static let iconMyClock = ImageAsset(name: "iconMyClock")
    internal static let iconSearch = ImageAsset(name: "iconSearch")
    internal static let iconTabFlag = ImageAsset(name: "iconTabFlag")
    internal static let iconTabLaw = ImageAsset(name: "iconTabLaw")
    internal static let iconTabProtocol = ImageAsset(name: "iconTabProtocol")
    internal static let iconTabSearch = ImageAsset(name: "iconTabSearch")
    internal static let iconTelegram = ImageAsset(name: "iconTelegram")
    internal static let iconTwitter = ImageAsset(name: "iconTwitter")
    internal static let iconYoutube = ImageAsset(name: "iconYoutube")
    internal static let logoElections = ImageAsset(name: "logoElections")
    internal static let logoOPORA = ImageAsset(name: "logoOPORA")
    internal static let logoOPORASmall = ImageAsset(name: "logoOPORASmall")
    internal enum MyColors {
      internal static let myBackground = ColorAsset(name: "myBackground")
      internal static let myGray = ColorAsset(name: "myGray")
      internal static let myYellow = ColorAsset(name: "myYellow")
      internal static let navBarColor = ColorAsset(name: "navBarColor")
      internal static let tabGradientEnd = ColorAsset(name: "tabGradientEnd")
      internal static let tabGradientStart = ColorAsset(name: "tabGradientStart")
      internal static let tagColor = ColorAsset(name: "tagColor")
    }
    internal static let placeholderDogCry = ImageAsset(name: "placeholderDogCry")
    internal static let placeholderGogThink = ImageAsset(name: "placeholderGogThink")
    internal static let splashBackground = ImageAsset(name: "splashBackground")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias SystemColor = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias SystemColor = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var systemColor: SystemColor = {
    guard let color = SystemColor(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  internal private(set) lazy var color: Color = {
    Color(systemColor)
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.SystemColor {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}

// swiftlint:enable convenience_type
