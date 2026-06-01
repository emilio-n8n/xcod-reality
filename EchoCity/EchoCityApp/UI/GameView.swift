// Fichier : EchoCity/EchoCityApp/UI/GameView.swift
import SwiftUI
import RealityKit

/**
 * GameView
 * Vue principale intégrant RealityView et l'interface de jeu (HUD).
 */
struct GameView: View {
    @StateObject private var gameCore = EchoCityGame()
    @ObservedObject var gameState = GameState.shared

    var body: some View {
        ZStack {
            // Scène 3D
            RealityView { content in
                await gameCore.setupScene(content)
            } update: { content in
                // Mises à jour de la scène si nécessaire
            }
            .gesture(SpatialTapGesture().targetedToAnyEntity().onEnded { event in
                print("EchoCity: Tapped entity \(event.entity.name)")

                // Interaction avec les logs
                if let log = event.entity as? CollectibleLog {
                    log.collect()
                } else if let parentLog = event.entity.parent as? CollectibleLog {
                    parentLog.collect()
                }
            })

            // HUD & UI
            VStack {
                HStack {
                    VehicleHUD()
                    Spacer()
                    MissionStatusView()
                }
                .padding(40)

                Spacer()

                HStack {
                    LogViewer()
                    Spacer()
                    VehicleSelector()
                }
                .padding(40)
            }
        }
    }
}

struct MissionStatusView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            Text("MISSION EN COURS")
                .font(.caption)
                .foregroundColor(.secondary)
            Text("Explorer la place centrale")
                .font(.headline)
        }
        .padding()
        .glassBackgroundEffect()
    }
}

struct VehicleSelector: View {
    @ObservedObject var gameState = GameState.shared

    var body: some View {
        HStack {
            Button("4x4") { gameState.changeVehicle(to: .car) }
            Button("Drone") { gameState.changeVehicle(to: .drone) }
            Button("Sub") { gameState.changeVehicle(to: .submarine) }
        }
        .padding()
        .glassBackgroundEffect()
    }
}
