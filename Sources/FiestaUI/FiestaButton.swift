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
        
        let borderStroke = configuration.isPressed ? StrokeStyle(lineWidth: 2, dash: [2]) : StrokeStyle()

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
            Button("Basic") { }
                .buttonStyle(FiestButtonStyle())
            
            Button(action: {}) {
                Label("Label", systemImage: "party.popper")
            }.fiestaStyle()

            Button("Cancel", role: .cancel) { }
                .fiestaStyle()
            
            Button("Delete", role: .destructive) { }
                .fiestaStyle()

        }.previewLayout(.sizeThatFits)
    }
}
