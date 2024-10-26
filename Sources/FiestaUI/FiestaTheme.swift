import SwiftUI

/// FestaTheme is a Theme implementation that provides "Fiesta" styling and coloring for SwiftUI components
public struct FiestaTheme: Theme {

    // TODO: One option here is to pass in the `colorScheme` ("is Dark mode") @Environment var to provide context of which color to use.
    // If that is done then the FiestaButtonStyle should also updated to not duplicate work since it also check for colorScheme at the
    // component level.
    
    // Colors
    public var colorBackgroundContainer: Color { Color.fiesta(FiestaColor.yellow) }

    public var colorBackgroundButton: Color { Color.fiesta(FiestaColor.blue) }
    public var colorBackgroundButtonSecondary: Color { Color.fiesta(.white) }
    public var colorBackgroundButtonDestructive: Color { Color.fiesta(FiestaColor.white) }
    
    public var colorTextButton: Color { Color.fiesta(.white) }
    public var colorTextButtonSecondary: Color { Color.fiesta(FiestaColor.blue) }
    public var colorTextButtonDestructive: Color { Color.fiesta(FiestaColor.red) }
    
    public var colorBorderButton: Color { Color.fiesta(.black) }
    public var colorBorderButtonSecondary: Color { Color.fiesta(FiestaColor.blue) }
    public var colorBorderButtonDestructive: Color { Color.fiesta(FiestaColor.red) }

    // Fonts
    public var fontButton = FiestaFont.fiestaStandard

    // Sizes
    public var padding = FiestaSize.paddingNormal
    public var cornerRadius = FiestaSize.cornerSmall

    // Behaviors
    public var scaleButtonPressed = FiestaBehavior.scale
    public var strokeStyleButtonPressed = FiestaBehavior.dottedBorder
    public var disabledBrightness = FiestaBehavior.brightnessLow
}
