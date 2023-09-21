//
//  FiestaColor.swift
//  
//
//  Created by Ryan Young on 9/19/23.
//

import Foundation
import UIKit
import SwiftUI

/// An enumeration of hex color strings that belong the Fiesta Theme. 
public enum FiestaColor: String {
    
    /// pure black (#000000)
    case black = "#000000"
    
    /// "Favor" blue (#3c98df)
    case blue = "#3c98df"
    
    /// "HEB" red (#dc291e)
    case red = "#dc291e"
    
    /// pure white (#ffffff)
    case white = "#ffffff"
    
    /// "Coupon" yellow (#fcd202)
    case yellow = "#fcd202"
}

public extension Color {
    /// A helper method to quickly add a FiestaColor to a SwiftUI Views
    ///
    /// This allow quick auto complete in Xcode, apposed to having to type out the full path like `FiestaColor.blue.color()`
    /// - Parameter color: The FiestaColor to convert to a Color struct
    /// - Returns: A Color struct representing the FiestaColor
    static func fiesta(_ color: FiestaColor) -> Color {
        return color.color()
    }
}

/// String Extension to convert hex strings like "#dc291e" to UIColor or SwiftUI Color equivalent.
public extension RawRepresentable where RawValue == String {

    /// Returns a SwiftUI Color struct for the string's hex value
    func color() -> Color {
        let rgb = self.toRGB()
        return Color(red: rgb.0, green: rgb.1, blue: rgb.2)
    }

    /// Returns a UIColor object for the string's hex value.
    func uiColor() -> UIColor {
        return UIColor(red: self.red(), green: self.green(), blue: self.blue(), alpha: 0.0)
    }
    
    private func toRGB() -> (Double, Double, Double) {
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
        return (red, green, blue)
    }
    
    private func toUInt() -> UInt64 {
        var hexValue: UInt64 = 0
        
        let scanner = Scanner(string: String(self.rawValue.dropFirst()))
        if scanner.scanHexInt64(&hexValue) {
            return hexValue
        }
        return hexValue
    }
    
    private func red() -> CGFloat {
        let bitPosition = 16
        return CGFloat((self.toUInt() & (0xff << bitPosition)) >> bitPosition)  / 255.0
    }
    
    private func green() -> CGFloat {
        let bitPosition = 8
        return CGFloat((self.toUInt() & (0xff << bitPosition)) >> bitPosition)  / 255.0
    }
    private func blue() -> CGFloat {
        return CGFloat(self.toUInt() & 0xff)  / 255.0
    }
}


