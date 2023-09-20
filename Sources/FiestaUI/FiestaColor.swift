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
    ///
    case white =  "#ffffff"
    case black =  "#000000"
    case yellow = "#fcd202"
    case red =    "#dc291e"
    case teal =   "#1cb0d4"
    case blue =   "#3c98df"
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

/// String Extension to convert hex strings like "#dc291e00" to UIColor or SwiftUI Color equivalent.
public extension RawRepresentable where RawValue == String {

    /// Returns a SwiftUI Color struct for the string's hex value
    func color() -> Color {
        return Color(red: self.red(), green: self.green(), blue: self.blue())
    }

    /// Returns a UIColor object for the string's hex value.
    func uiColor() -> UIColor {
        return UIColor(red: self.red(), green: self.green(), blue: self.blue(), alpha: 0.0)
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
        let bitPosition = 24
        return CGFloat((self.toUInt() & (0xff << bitPosition)) >> bitPosition)  / 255.0
    }
    
    private func green() -> CGFloat {
        let bitPosition = 16
        return CGFloat((self.toUInt() & (0xff << bitPosition)) >> bitPosition)  / 255.0
    }
    private func blue() -> CGFloat {
        let bitPosition = 8
        return CGFloat((self.toUInt() & (0xff << bitPosition)) >> bitPosition)  / 255.0
    }
}


