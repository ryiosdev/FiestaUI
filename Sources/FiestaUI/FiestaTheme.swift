import UIKit
import SwiftUI

public struct FiestaTheme: Theme {
    
    public var colorBackgroundButton: Color {
        get {
            .fiesta(.blue)
        }
    }
    public var colorBackgroundButtonSecondary = Color.white
    public var colorBackgroundButtonDestructive = Color.white
    
    public var colorTextButton = Color.white
    public var colorTextButtonSecondary = Color.blue
    public var colorTextButtonDestructive = Color.red
    
    public var colorBorderButton = Color.black
    public var colorBorderButtonSecondary = Color.blue
    public var colorBorderButtonDestructive = Color.red

    public var fontButton = FiestaFont.fiesta10
    
    public var padding = CGFloat(8.0)
    
    public var cornerRadius = CGFloat(5.0)
}
