//
//  FiestaButton.swift
//  
//
//  Created by Ryan Young on 9/19/23.
//

import SwiftUI

/// A custom ButtonStyle that applies the FiestaTheme to standard SwiftUI Buttons
///
/// You can either pass in a `FiestaButtonStyle` instance to the `buttonStyle` view modifier or the convenience View extension `.fiestaStyle`
/// You may also override the standard internal padding by passing in the `padding` parameter to the ``init(padding:)`` method which is helpful for buttons with images.
/// Sample usage:
///  ```swift
///Button("Basic") { }
///    .buttonStyle(FiestButtonStyle())
///
///Button(action: {}) {
///    Label("Lable", systemImage: "party.popper")
///}.fiestaStyle()
///
///Button("Cancel", role: .cancel) { }
///   .fiestaStyle()
///
///Button("Delete", role: .destructive) { }
///    .fiestaStyle()
///```
public struct FiestaButtonStyle: ButtonStyle {
    @Environment(\.theme) private var theme: Theme
    @Environment(\.isEnabled) private var enabled: Bool

    /// Optional padding override of the default Fiesta theme (``FiestaTheme.padding``)  value applied to the contents of the button
    private var paddingOverride: CGFloat?
    
    /// Creates FiestaButtonStyle that applies the FiestaTheme to standard SwiftUI Buttons
    ///
    /// - Parameter padding: optional padding value override,  if no input is provided (`nil`) then the default `Theme.padding` value is used instead
    public init(padding: CGFloat? = nil) {
        paddingOverride = padding
    }
    
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
        
        // Apply fancy border
        let borderStroke = configuration.isPressed ? StrokeStyle(lineWidth: 2, dash: [2]) : StrokeStyle()
        
        // Change brighness based on enabled/disabled
        let brightness = enabled ? 0.0 : theme.disabledBrightness
        
        return configuration.label
            .padding(paddingOverride ?? theme.padding)
            .font(theme.fontButton)
            .foregroundColor(forgroundColor)
            .background(backgroundColor)
            .cornerRadius(theme.cornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: theme.cornerRadius, style: .continuous)
                    .strokeBorder(style: borderStroke)
                    .foregroundColor(borderColor)
            }
            .brightness(brightness)
    }
}

public extension Button {
    /// A shortcut to `buttonStyle(FiestaButtonStyle())`
    func fiestaStyle() -> some View {
        buttonStyle(FiestaButtonStyle())
    }
}

struct FiestaButton_Previews: PreviewProvider {
    static var previews: some View {
        FiestaUI.loadFonts()
        return Group {
            Button("Basic") { }
                .buttonStyle(FiestaButtonStyle())
            
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
