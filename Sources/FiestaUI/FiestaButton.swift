//
//  FiestaButton.swift
//  
//
//  Created by Ryan Young on 9/19/23.
//

import SwiftUI

public struct FiestButtonStyle: ButtonStyle {
    @Environment(\.theme) var theme: Theme
    
    public func makeBody(configuration: Configuration) -> some View {

        // Apply Default styling
        var backgroundColor = theme.colorBackground
        let forgroundColor = theme.colorText
        var borderColor = theme.colorBorder
        let font = theme.fontButton
        
        // on press of Basic button
        if configuration.isPressed {
            borderColor = theme.colorAccent
        }
        
        // If the button has a role specified, adjust the styling
        if configuration.role == .cancel {
            backgroundColor = theme.colorAccent
        }
        
        return configuration.label
            .padding(theme.padding)
            .background(backgroundColor)
            .cornerRadius(theme.cornerRadius)
            .font(font)
            .foregroundColor(forgroundColor)
            .overlay {
                RoundedRectangle(cornerRadius: theme.cornerRadius, style: .continuous)
                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [2]))
                    .foregroundColor(borderColor)
            }
    }
}



struct FiestaButton_Previews: PreviewProvider {
    
    static var previews: some View {
        FiestaUI.loadFonts()
        
        return Group {
            Button("The Quick Brown Fox") { action() }
                .buttonStyle(FiestButtonStyle())

            Button("Jumps Over The Lazy Dog", role: .cancel) { action() }
                .buttonStyle(FiestButtonStyle())

        }.previewLayout(.sizeThatFits)
    }
    
    static func action() {
        print("hello world!")

    }
}
