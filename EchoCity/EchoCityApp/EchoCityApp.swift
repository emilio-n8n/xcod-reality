// Fichier : EchoCity/EchoCityApp/EchoCityApp.swift
import SwiftUI

/**
 * EchoCityApp
 * Point d'entrée de l'application visionOS.
 */
@main
struct EchoCityApp: App {

    @StateObject private var gameState = GameState.shared

    var body: some Scene {
        // Fenêtre principale pour les menus
        WindowGroup {
            if gameState.currentPhase == .mainMenu {
                MainMenuView()
            } else {
                GameView()
            }
        }
        .windowStyle(.volumetric) // Adapté pour le contenu 3D si besoin
        .defaultSize(width: 1.2, height: 1.0, depth: 1.0, in: .meters)

        // Espace Immersif pour le gameplay
        ImmersiveSpace(id: "CitySpace") {
            // Dans une version plus complexe, RealityView pourrait être ici
            // Pour ce build 24h, nous mixons GameView avec WindowGroup/RealityView
        }
    }
}
