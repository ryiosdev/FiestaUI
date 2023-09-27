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
    @State var orderText = "Place Order"
    @State var isLoading = false
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
            .disabled(!buttonsEnabled)

            Button(action: { action() }) {
                VStack() {
                    Text("Fiesta Theme Text")
                    Text("Overridden Font Text and Color")
                        .font(.caption)
                        .foregroundColor(.indigo)
                }
            }
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
            .disabled(!buttonsEnabled)


            Button("Delete", role: .destructive) {
                action()
            }
            .disabled(!buttonsEnabled)
            
            HStack {
                if isLoading {
                    ProgressView()
                }
                Button(orderText) {
                    Task {
                        isLoading = true
                        await placeOrder()
                        isLoading = false
                    }
                }
            }
            
            FiestaButton(print("hi")) {
                Label("Fiesta Button", systemImage: "party.popper")
            }

        }
        .padding(theme.padding)
        .background(theme.colorBackgroundContainer)
        .cornerRadius(theme.cornerRadius)
        .fiestaButtonStyle()

    }
    
    func action() {
        print("Here, Everyone Belongs!")
    }
    
    func placeOrder() async {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("invalid url")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let model = try JSONDecoder().decode(Model.self, from: data)
            print("result count : \(model.resultCount)")
            orderText = "Ordered \(model.resultCount)"
            
        } catch {
            print("request failed")
        }
    }
    
}

struct Model: Codable {
    var resultCount: Int
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
