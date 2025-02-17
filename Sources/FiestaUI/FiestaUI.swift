//
//  FiestaUI.swift
//  
//
//  Created by Ryan Young on 9/19/23.
//

import Foundation
import SwiftUI


/// The main  struct representing the FiestaUI API
///
///  -Note: 
public struct FiestaUI {
    
    /// Loads the fonts used by the FestaUI package into app memory.
    ///
    /// Call this method at app launch similar to this:
    /// ```swift
    /// @main
    /// struct FiestaSampleAppApp: App {
    ///    init() {
    ///        FiestaUI.loadFonts()
    ///    }
    /// }
    /// ```
    ///
    /// Or in swift previews like this:
    /// ```swift
    /// struct MyView_Previews: PreviewProvider {
    ///     static var previews: some View {
    ///         FiestaUI.loadFonts()
    ///         return MyView()
    ///     }
    /// }
    /// ```
    public static func loadFonts() {
        if let url = Bundle.module.url(forResource: "Fiesta", withExtension: ".ttf") {
            if let dataProvider = CGDataProvider(url: url as CFURL) {
                if let font = CGFont(dataProvider) {
                    CTFontManagerRegisterGraphicsFont(font, nil)
                }
            }
        }
    }

    public static func loadImage(_ name: String) -> UIImage? {
        return UIImage(named: name, in: Bundle.module, compatibleWith: nil)
    }
}

