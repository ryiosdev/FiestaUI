//
//  FiestaUI.swift
//  
//
//  Created by Ryan Young on 9/19/23.
//

import Foundation
import SwiftUI

public struct FiestaUI {
 
    public static func loadFonts() {
        if let url = Bundle.module.url(forResource: "Fiesta", withExtension: ".ttf") {
            if let dataProvider = CGDataProvider(url: url as CFURL) {
                if let font = CGFont(dataProvider) {
                    CTFontManagerRegisterGraphicsFont(font, nil)
                }
            }
        }
    }
    
    var text: String { "Hello, World!" }
}


