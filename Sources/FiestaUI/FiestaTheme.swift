import UIKit
import SwiftUI


public struct FiestaTheme: Theme {
    public var colorBackground = FiestaColors.teal.color()
    
    public var colorText = FiestaColors.black.color()

    public var colorBorder = FiestaColors.yellow.color()
    
    public var colorAccent = FiestaColors.red.color()

    public var fontButton = FiestaFont.fiesta
    
    public var padding = CGFloat(8.0)
    
    public var cornerRadius = CGFloat(5.0)
}
