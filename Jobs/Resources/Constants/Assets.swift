// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI

internal extension Color {
  // Assets.xcassets
  // Colors.xcassets
  static var accent : Color { Color("accent", bundle: BundleToken.bundle) }
  static var contrastBackground : Color { Color("contrastBackground", bundle: BundleToken.bundle) }
  static var mainBackground : Color { Color("mainBackground", bundle: BundleToken.bundle) }
  static var text : Color { Color("text", bundle: BundleToken.bundle) }
}

internal extension Image {
  // Assets.xcassets
  // Colors.xcassets
}

private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}

internal extension Color {
    var uiColor: UIColor {
        return UIColor(self)
    }
}