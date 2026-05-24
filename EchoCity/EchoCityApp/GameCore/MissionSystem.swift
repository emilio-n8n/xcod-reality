// Fichier : EchoCity/EchoCityApp/GameCore/MissionSystem.swift
import Foundation

/**
 * MissionSystem
 * Suit la progression des objectifs du joueur.
 */
class MissionSystem: ObservableObject {

    struct Mission: Identifiable {
        let id: String
        let title: String
        let description: String
        var isCompleted: Bool = false
    }

    @Published var activeMissions: [Mission] = []

    init() {
        setupInitialMissions()
    }

    func completeMission(id: String) {
        if let index = activeMissions.firstIndex(where: { $0.id == id }) {
            activeMissions[index].isCompleted = true
            print("EchoCity: Mission Completed - \(activeMissions[index].title)")
            unlockNextMission(after: id)
        }
    }

    private func setupInitialMissions() {
        activeMissions = [
            Mission(id: "m_explore", title: "Exploration Urbaine", description: "Utilisez le 4x4 pour explorer la place centrale.")
        ]
    }

    private func unlockNextMission(after missionID: String) {
        // Logic to chain missions
        if missionID == "m_explore" {
            activeMissions.append(Mission(id: "m_drone", title: "Vue d'en haut", description: "Déployez le drone pour scanner le toit de l'administration."))
        }
    }
}
