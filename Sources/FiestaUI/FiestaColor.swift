//
//  FiestaColor.swift
//  
//
//  Created by Ryan Young on 9/19/23.
//

import Foundation
import UIKit
import SwiftUI

public extension Color {
    /// A helper method to quickly add a FiestaColor to a SwiftUI Views
    ///
    /// This allow quick auto complete in Xcode, apposed to having to type out the full path like `FiestaColor.blue.color()`
    /// - Parameter color: The FiestaColor to convert to a Color struct
    /// - Returns: A Color struct representing the FiestaColor
    static func fiesta(_ color: FiestaColor) -> Color {
        return color.toColor()
    }
}

/// An enumeration of hex color strings that belong the Fiesta Theme.
public enum FiestaColor: String {
    /// pure black (#000000)
    case black = "#000000"

    ///  blue (#3c98df)
    case blue = "#3c98df"

    ///  red (#dc291e)
    case red = "#dc291e"

    /// pure white (#ffffff)
    case white = "#ffffff"

    ///  yellow (#fcd202)
    case yellow = "#fcd202"
}

/// A type that can be converted to a tuple of RGB values, Color Struct, and UIColor Class
public protocol ColorConvertable {
    func toRGB() -> (r: Double, g: Double, b: Double)
    func toColor() -> Color
    func toUIColor() -> UIColor
}

extension FiestaColor: ColorConvertable {
    /// Returns a tuple of (red, green, blue) Double (0.0 - 1.0) color components for the string's hex value
    public func toRGB() -> (r: Double, g: Double, b: Double) {
        var red = 0.0
        var green = 0.0
        var blue = 0.0

        //temp var to store the converted hex
        var hex: UInt64 = 0

        //drop the `#`
        let dropHash = String(self.rawValue.dropFirst())

        //scan the first two hex character for red
        if Scanner(string: String(dropHash.dropLast(4))).scanHexInt64(&hex) {
            red = Double(hex) / 255.0
        }
        //scan the middle two hex characters for green
        if Scanner(string: String(dropHash.dropLast(2).dropFirst(2))).scanHexInt64(&hex) {
            green = Double(hex) / 255.0
        }
        //scan the last two hex characters for blue
        if Scanner(string: String(dropHash.dropFirst(4))).scanHexInt64(&hex) {
            blue = Double(hex) / 255.0
        }
        return (r: red, g: green, b: blue)
    }

    /// Returns a SwiftUI Color struct for the string's hex value
    public func toColor() -> Color {
        let rgb = self.toRGB()
        return Color(red: rgb.r, green: rgb.g, blue: rgb.b)
    }

    /// Returns a UIColor object for the string's hex value.
    public func toUIColor() -> UIColor {
        let rgb = self.toRGB()
        return UIColor(red: rgb.r, green: rgb.g, blue: rgb.b, alpha: 0.0)
    }
}


