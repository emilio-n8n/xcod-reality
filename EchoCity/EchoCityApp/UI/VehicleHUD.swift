// Fichier : EchoCity/EchoCityApp/UI/VehicleHUD.swift
import SwiftUI

/**
 * VehicleHUD
 * Affiche les informations de navigation en temps réel.
 */
struct VehicleHUD: View {
    @ObservedObject var gameState = GameState.shared

    // Valeurs mockées pour la démo
    @State private var currentSpeed: Float = 42.0
    @State private var battery: Float = 0.85

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(gameState.activeVehicleType.rawValue.uppercased())
                .font(.caption2)
                .tracking(2)

            HStack(alignment: .firstTextBaseline) {
                Text("\(Int(currentSpeed))")
                    .font(.system(size: 40, weight: .bold, design: .monospaced))
                Text("KM/H")
                    .font(.caption)
            }

            ProgressView(value: battery) {
                Text("ÉNERGIE")
                    .font(.system(size: 8))
            }
            .tint(.cyan)
        }
        .padding()
        .frame(width: 150)
        .glassBackgroundEffect()
    }
}
