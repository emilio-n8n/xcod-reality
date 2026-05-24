// Fichier : EchoCity/EchoCityApp/UI/MainMenuView.swift
import SwiftUI

/**
 * MainMenuView
 * Écran d'accueil du jeu.
 */
struct MainMenuView: View {
    @ObservedObject var gameState = GameState.shared
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    var body: some View {
        VStack(spacing: 40) {
            Text("ECHO CITY")
                .font(.system(size: 80, weight: .black, design: .monospaced))
                .foregroundColor(.white)
                .shadow(radius: 10)

            VStack(spacing: 20) {
                Button(action: {
                    Task {
                        await openImmersiveSpace(id: "CitySpace")
                        gameState.startGame()
                    }
                }) {
                    Text("COMMENCER L'EXPLORATION")
                        .font(.headline)
                        .padding()
                        .frame(width: 300)
                        .glassBackgroundEffect()
                }

                Button(action: {
                    // Action for settings
                }) {
                    Text("OPTIONS")
                        .padding()
                        .frame(width: 300)
                        .glassBackgroundEffect()
                }
            }
        }
        .padding(100)
        .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(.ultraThinMaterial)
                .opacity(0.8)
        )
    }
}

#Preview {
    MainMenuView()
}
