//
//  FiestaSampleAppApp.swift
//  FiestaSampleApp
//
//  Created by Ryan Young on 9/20/23.
//

import SwiftUI
import FiestaUI

@main
struct FiestaSampleAppApp: App {
    init() {
        // Initializing the FiestaUI component library
        FiestaUI.loadFonts()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
