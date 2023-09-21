//
//  ContentView.swift
//  FiestaSampleApp
//
//  Created by Ryan Young on 9/20/23.
//

import SwiftUI
import FiestaUI

struct ContentView: View {
    @Environment(\.theme) public var theme: Theme
    
    @State var buttonsEnabled = true
    
    var body: some View {
        VStack(spacing: theme.padding) {
            Toggle("Enable Buttons", isOn: $buttonsEnabled)
                .font(FiestaFont.fiestaSmall)
            
            Button("Fiesta") {
                action()
            }
            .buttonStyle(FiestaButtonStyle())
            .disabled(!buttonsEnabled)

            Button(action: { action() }) {
                Label("Label", systemImage: "party.popper")
            }
            .fiestaStyle()
            .disabled(!buttonsEnabled)

            Button(action: { action() }) {
                VStack() {
                    Text("Fiesta Theme Text")
                    Text("Overriden Font Text and Color")
                        .font(.caption)
                        .foregroundColor(.indigo)
                }
            }
            .fiestaStyle()
            .disabled(!buttonsEnabled)
            
            Button(action: { action() }) {
                Image("heb")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50.0)
                    .background(Color.fiesta(.red))
            }
            .buttonStyle(FiestaButtonStyle(padding: 0.0))
            .disabled(!buttonsEnabled)

            Button("Cancel", role: .cancel) {
                action()
            }
            .fiestaStyle()
            .disabled(!buttonsEnabled)


            Button("Delete", role: .destructive) {
                action()
            }
            .fiestaStyle()
            .disabled(!buttonsEnabled)
        }
        .padding(theme.padding)
        .background(theme.colorBackgroundContainer)
        .cornerRadius(theme.cornerRadius)

    }
    
    func action() {
        print("Here, Everyone Belongs!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
