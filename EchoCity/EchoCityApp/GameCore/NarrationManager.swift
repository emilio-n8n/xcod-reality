// Fichier : EchoCity/EchoCityApp/GameCore/NarrationManager.swift
import Foundation

/**
 * NarrationManager
 * Gère les entrées narratives, les logs audio et les hologrammes.
 * Centralise le contenu textuel et les déclencheurs de narration.
 */
class NarrationManager {

    struct LogEntry: Identifiable {
        let id: String
        let title: String
        let content: String
        let speaker: String
        let timestamp: Date
    }

    // MARK: - Properties

    private(set) var availableLogs: [LogEntry] = []

    // MARK: - Initializer

    init() {
        loadNarrativeData()
    }

    // MARK: - Methods

    func getLog(byID id: String) -> LogEntry? {
        return availableLogs.first { $0.id == id }
    }

    func playHologramSequence(id: String) {
        print("EchoCity: Playing Hologram \(id)")
        // RealityKit transition logic would be triggered here via NotificationCenter or Delegate
    }

    // MARK: - Data Loading

    private func loadNarrativeData() {
        // Mock data for the 24h build
        availableLogs = [
            LogEntry(id: "log_001",
                     title: "L'évacuation",
                     content: "Ils sont partis si vite. Les rues sont encore pleines de leurs souvenirs.",
                     speaker: "Commander Miller",
                     timestamp: Date()),
            LogEntry(id: "log_002",
                     title: "Signal Écho",
                     content: "On capte une résonance sous la place centrale. Quelque chose est resté activé.",
                     speaker: "Tech Sarah",
                     timestamp: Date().addingTimeInterval(-3600)),
            LogEntry(id: "log_003",
                     title: "Profondeurs",
                     content: "L'eau monte dans les niveaux inférieurs. Le sous-marin est requis.",
                     speaker: "System AI",
                     timestamp: Date().addingTimeInterval(-7200))
        ]
    }
}
