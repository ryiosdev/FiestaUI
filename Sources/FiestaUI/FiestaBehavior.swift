//
//  File.swift
//  
//
//  Created by Ryan Young on 9/23/23.
//

import SwiftUI

public enum FiestaBehavior {

    /// The default scale to animate to for SwiftUI fadeInOut animations. See ``FiestaButtonStyle`` as an example
    public static let scale = 0.95

    /// Applies a dotted line stroke, for use with rounded rectangles and buttons
    public static let dottedBorder = StrokeStyle(lineWidth: 2, dash: [2])

    /// A brightness value of ~30 %
    public static let brightnessLow = 0.30
}
