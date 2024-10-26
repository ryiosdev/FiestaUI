# FiestaUI
A SwiftUI Component Library with a Texas Flair
- Note: Currently the only custom SwiftUI component available is `FiestaButtonStyle` which allows applying the "FiestaTheme" to _any_ SwiftUI Button.

## Getting Started
1. Import this swift package into your app.
2. Call the `FiestaUI.loadFonts()` at app launch similar to this.
```swift
import FiestaUI

@main
struct FiestaSampleAppApp: App {
    init() {
        FiestaUI.loadFonts()
    }
}
```
3. Apply the `FiestaButtonStyle` to your SwiftUI Buttons.
```swift
import FiestaUI

Button("Fiesta") {
    action()
}
.fiestaStyle()
```
- Note: You can also use variations of SwiftUI Button with the `FiestaButtonStyle`. For example using `.cancel` "role" will automatically adjust the styling for a Cancel button.
4. Or you can use the custom `FiestaButton` in your SwiftUI views and the style will be applied automatically.
```swift
import FiestaUI
FiestaButton(print("Hi")) {
  Label("Fiesta Button", systemImage: "bolt")
}
```
## Internal Festa Sample App
Bundled inside FiestaUI repo is a sample app named `FiestaSampleApp`. You can use this app to see the FiestaUI library in action.
You can get to it by cloning the repository with `git clone git@github.com:ryiosdev/FiestaUI.git` and opening the `FiestaUI/FiestaSampleApp` folder.

## Documentation
The code is documented mainly conforming to the [Swift DocC](https://developer.apple.com/documentation/docc) format.
- Note: If time allows, I will add an additional DocC overview to help organize and navigate the library.

### API Documentation in Xcode
Open the root `Package.swift` file in Xcode, and select the "Product" menu, and then "Build Documentation". 
This will open Developer Documentation window featuring the FestaUI package's documentation.

