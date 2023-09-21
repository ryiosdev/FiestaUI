import UIKit
import SwiftUI

/// FestaTheme is a Theme implementation that provides "Fiesta" styling and coloring for SwiftUI components
public struct FiestaTheme: Theme {
    
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

    public var fontButton = FiestaFont.fiestaStandard
    
    public var padding = FiestaSize.paddingNormal
    public var cornerRadius = FiestaSize.cornerSmall
    public var disabledBrightness = FiestaColor.brightnessLow
}
