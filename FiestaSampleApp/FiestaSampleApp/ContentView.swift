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
        NavigationStack {
            List {
                Button("Fiesta") {
                    action()
                }
                .buttonStyle(FiestaButtonStyle())

                Button(action: { action() }) {
                    Label("Label", systemImage: "party.popper")
                }

                Button(action: { action() }) {
                    VStack() {
                        Text("Fiesta Theme Text")
                        Text("Overridden Font Text and Color")
                            .font(.caption)
                            .foregroundColor(.indigo)
                    }
                }

#if canImport(UIKit)
                Button(action: { action() }) {
                    Image(uiImage: FiestaUI.loadImage("atm")!)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50.0)
                        .background(Color.fiesta(.white))
                }
                .buttonStyle(FiestaButtonStyle(padding: 0.0))
#endif

                Button("Cancel", role: .cancel) {
                    action()
                }


                Button("Delete", role: .destructive) {
                    action()
                }

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
            .cornerRadius(theme.cornerRadius)
            .disabled(!buttonsEnabled)
            .fiestaButtonStyle()
            .toolbar {
                Toggle("Enable Buttons", isOn: $buttonsEnabled)
                    .font(FiestaFont.fiestaSmall)
            }
        }
    }

    func action() {
        print("SwiftUI!")
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
