//
//  Theme.swift
//  
//
//  Created by Ryan Young on 9/19/23.
//

import SwiftUI

/// Theme Protocol contains all of the properties needed to implement a custom theme.
///
/// - NOTE: At this time only a custom Button theme is supported!
///
public protocol Theme {
    
    /// A background color for containers
    ///
    /// Use this background color in collections like Group, VStack, HStack, etc.
    var colorBackgroundContainer: Color { get }
    
    // below are specific colors for Buttons
    var colorBackgroundButton: Color { get }
    var colorBackgroundButtonSecondary: Color { get }
    var colorBackgroundButtonDestructive: Color { get }

    var colorTextButton: Color { get }
    var colorTextButtonSecondary: Color { get }
    var colorTextButtonDestructive: Color { get }

    var colorBorderButton: Color { get }
    var colorBorderButtonSecondary: Color { get }
    var colorBorderButtonDestructive: Color { get }

    /// The Theme's font for Buttons
    ///
    /// For use with the SwiftUI `.font()` modifier
    var fontButton: Font { get }
    
    /// A standard padding value between SwiftUI elements
    ///
    /// For use with the SwiftUI `.padding()` view modifier
    var padding: CGFloat { get }
    
    /// A standard value for corner radii
    ///
    /// For use with the SwiftUI `.cornerRadius()` view modifier
    var cornerRadius: CGFloat { get }
    
    /// A standard brightness value
    ///
    /// For use with the SwiftUI `.brightness()`view modifier
    var disabledBrightness: Double { get }
}

/// The SwiftUI Environment key to obtain a globally available Theme implementation
///
/// The default Environment Theme is FiestaTheme
public struct ThemeEnvironmentKey: EnvironmentKey {
    public static let defaultValue: Theme = FiestaTheme()
}

/// The Theme Environment variable
public extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeEnvironmentKey.self] }
        set { self[ThemeEnvironmentKey.self] = newValue }
    }
}
