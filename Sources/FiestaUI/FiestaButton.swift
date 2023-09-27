//
//  FiestaButton.swift
//  
//
//  Created by Ryan Young on 9/27/23.
//

import SwiftUI


/// A custom Button with the FiestaButtonStyle
///
/// ``FiestaButton`` is a simple`SwiftUI.Button` wrapper view with the ``fiestaButtonStyle()`` already applied.
///
/// Sample usage:
///  ```swift
///  FiestaButton {
///    print("fiesta button")
///  } content: {
///    Text("FiestaButton")
///  }
///```
///
/// See also the SwiftUI previews in `FiestaButtonStyle.swift` in the `FiestaUI` swift package to see more examples of usage.
///
/// > Important:  The  ``FiestaUI/FiestaUI/loadFonts()`` must be called around app launch to see the custom fonts within this component.
public struct FiestaButton<Label: View>: View {
    public var action: () -> Void
    public var label: () -> Label
    
    // Using @autoclosure to help minimize needing to wrap action in a closure
    // Using @escaping since closures may not be called from within this init method
    public init(_ action: @autoclosure @escaping () -> Void, label: @escaping () -> Label) {
        self.action = action
        self.label = label
    }
    
    public var body: some View {
        Button(action: action, label: label).fiestaButtonStyle()
    }
}

struct FiestaButton_Previews: PreviewProvider {
    static var previews: some View {
        FiestaUI.loadFonts()

        return FiestaButton(print("Hi")) {
            Label("Fiesta Button", systemImage: "bolt")
        }

    }
}
