//
//  File.swift
//  
//
//  Created by Ryan Young on 9/19/23.
//

import Foundation
import UIKit
import SwiftUI

/// An enumeration of hex color strings that belong the Fiesta Theme. 
public enum FiestaColors: String {
    case white = "#ffffff00"
    case black = "#00000000"
    case yellow = "#fcd20200"
    case red = "#dc291e00"
    case teal = "#1cb0d400"
}

/// String Extension to convert hex strings like "#dc291e00" to UIColor or SwiftUI Color equivalent.
public extension RawRepresentable where RawValue == String {

    /// Returns a SwiftUI Color struct for the string's hex value
    func color() -> Color {
        return Color(red: self.red(), green: self.green(), blue: self.blue())
    }

    /// Returns a UIColor object for the string's hex value.
    func uiColor() -> UIColor {
        return UIColor(red: self.red(), green: self.green(), blue: self.blue(), alpha: self.alpha())
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
    private func alpha() -> CGFloat {
        return CGFloat(self.toUInt() & 0xff) / 255.0
    }
}


