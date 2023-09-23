//
//  FiestaButtonStyle.swift
//  
//
//  Created by Ryan Young on 9/19/23.
//

import SwiftUI

/// A custom ButtonStyle that applies the FiestaTheme to standard SwiftUI Buttons
///
/// You can either pass in a `FiestaButtonStyle` instance to the `buttonStyle` view modifier or the convenience View extension `.fiestaButtonStyle` which can be used on container views.
///
/// You may also override the standard internal padding by passing in the `padding` parameter to the ``init(padding:)`` method which is helpful for buttons with images.
/// Sample usage:
///  ```swift
///Button("Basic") { }
///    .buttonStyle(FiestaButtonStyle())
///
///Button(action: {}) {
///    Label("Label", systemImage: "party.popper")
///}.fiestaStyle()
///
///Button("Cancel", role: .cancel) { }
///   .fiestaStyle()
///
///Button(action: {}) {
///    Image("SwiftUI")
/// }.buttonStyle(FiestaButtonStyle(padding: 0.0))
///```
public struct FiestaButtonStyle: ButtonStyle {
    @Environment(\.theme) private var theme: Theme
    @Environment(\.isEnabled) private var enabled: Bool
    @Environment(\.colorScheme) private var scheme

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
        var foregroundColor = theme.colorTextButton
        var borderColor = scheme == .light ? theme.colorBorderButton : .fiesta(.white)
        
        // If the button has a role specified, adjust the styling
        if configuration.role == .cancel {
            backgroundColor = scheme == .light ? theme.colorBackgroundButtonSecondary : .fiesta(.black)
            foregroundColor = theme.colorTextButtonSecondary
            borderColor = theme.colorBorderButtonSecondary
            
        } else if configuration.role == .destructive {
            backgroundColor = scheme == .light ? theme.colorBackgroundButtonDestructive : .fiesta(.black)

            foregroundColor = theme.colorTextButtonDestructive
            borderColor = theme.colorBorderButtonDestructive
        }
        
        // Apply fancy border
        let borderStroke = configuration.isPressed ? theme.strokeStyleButtonPressed : StrokeStyle()

        // Change brightness based on enabled/disabled
        let brightness = enabled ? 0.0 : theme.disabledBrightness
        
        return configuration.label
            .padding(paddingOverride ?? theme.padding)
            .font(theme.fontButton)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(theme.cornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: theme.cornerRadius, style: .continuous)
                    .strokeBorder(style: borderStroke)
                    .foregroundColor(borderColor)
            }
            .scaleEffect(configuration.isPressed ? theme.scaleButtonPressed : 1.0)
            .animation(.easeInOut, value: configuration.isPressed)
            .brightness(brightness)
    }
}

public extension View {
    /// A shortcut to `.buttonStyle(FiestaButtonStyle())`
    func fiestaButtonStyle() -> some View {
        buttonStyle(FiestaButtonStyle())
    }
}

struct FiestaButton_Previews: PreviewProvider {
    static var previews: some View {
        FiestaUI.loadFonts()
        return Group {
            HStack {
                VStack {
                    Text("Standard")
                    basic
                }
                VStack {
                    Text("Disabled")
                    basic.disabled(true)
                }
            }
            .previewDisplayName("Basic")

            HStack {
                VStack {
                    Text("Standard")
                    roles
                }
                VStack {
                    Text("Disabled")
                    roles.disabled(true)
                }
            }
            .previewDisplayName("Roles")
        }
        .previewLayout(.sizeThatFits)
        .fiestaButtonStyle()
    }

    @ViewBuilder static var basic: some View {
        VStack {
            Button("Basic") {}
            Button(action: {}) {
                Label("Label", systemImage: "party.popper")
            }
            Button(action: {}) {
                Image(systemName: "party.popper")
            }
            Button(action: {}) {
                VStack {
                    Text("Text 1")
                    Text("Text 2")
                }
            }
        }
    }

    @ViewBuilder static var roles: some View {
        VStack {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) { }
        }
    }
}
