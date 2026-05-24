// Fichier : EchoCity/EchoCityApp/UI/LogViewer.swift
import SwiftUI

/**
 * LogViewer
 * Affiche les logs narratifs découverts par le joueur.
 */
struct LogViewer: View {
    @ObservedObject var gameState = GameState.shared

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("LOGS RÉCUPÉRÉS (\(gameState.discoveredLogs.count))")
                .font(.caption)
                .bold()

            ScrollView {
                VStack(alignment: .leading) {
                    if gameState.discoveredLogs.isEmpty {
                        Text("Aucun log trouvé...")
                            .italic()
                            .font(.subheadline)
                    } else {
                        ForEach(gameState.discoveredLogs, id: \.self) { logID in
                            Text("• \(logID)")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .frame(height: 100)
        }
        .padding()
        .frame(width: 250)
        .glassBackgroundEffect()
    }
}
