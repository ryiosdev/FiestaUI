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
        var backgroundColor = theme.colorBackgroundButton
        var forgroundColor = theme.colorTextButton
        var borderColor = theme.colorBorderButton
        
        // If the button has a role specified, adjust the styling
        if configuration.role == .cancel {
            backgroundColor = theme.colorBackgroundButtonSecondary
            forgroundColor = theme.colorTextButtonSecondary
            borderColor = theme.colorBorderButtonSecondary
            
        } else if configuration.role == .destructive {
            backgroundColor = theme.colorBackgroundButtonDestructive
            forgroundColor = theme.colorTextButtonDestructive
            borderColor = theme.colorBorderButtonDestructive
        }
        
        let borderStroke = configuration.isPressed ? StrokeStyle(lineWidth: 1, dash: [1]) : StrokeStyle()
        
        return configuration.label
            .padding(theme.padding)
            .font(theme.fontButton)
            .foregroundColor(forgroundColor)
            .background(backgroundColor)
            .cornerRadius(theme.cornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: theme.cornerRadius, style: .continuous)
                    .strokeBorder(style: borderStroke)
                    .foregroundColor(borderColor)
            }
    }
}

public extension Button {
    func fiestaStyle() -> some View {
        buttonStyle(FiestButtonStyle())
    }
}

struct FiestaButton_Previews: PreviewProvider {
    
    static var previews: some View {
        FiestaUI.loadFonts()
        return Group {
            Button("The Quick Brown Fox") { action() }
                .buttonStyle(FiestButtonStyle())

            Button("Jumps Over", role: .cancel) { action() }
                .fiestaStyle()
            
            Button("The Lazy Dog", role: .destructive) { action() }
                .fiestaStyle()

        }.previewLayout(.sizeThatFits)
    }
    
    static func action() {
        print("hello world!")

    }
}
