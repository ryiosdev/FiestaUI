//
//  Theme.swift
//  
//
//  Created by Ryan Young on 9/19/23.
//

import SwiftUI

/// Theme Protocol contains all of the properties needed to implement a custom theme.
public protocol Theme {
    
    var colorBackground: Color { get }
    var colorText: Color { get }
    var colorBorder: Color { get }
    var colorAccent: Color { get }
    
    var fontButton: Font { get }
    
    var padding: CGFloat { get }
    var cornerRadius: CGFloat { get }
}

/// The SwiftUI Environment key to obtain a globally available Theme implementation
///
/// The default Environment Theme is FiestaTheme
private struct ThemeEnvironmentKey: EnvironmentKey {
    static let defaultValue: Theme = FiestaTheme()
}

extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeEnvironmentKey.self] }
        set { self[ThemeEnvironmentKey.self] = newValue }
    }
}
