// Fichier : EchoCity/EchoCityApp/GameCore/GameState.swift
import Foundation
import Combine

/**
 * GameState
 * Gère l'état global du jeu, la progression de l'utilisateur et les paramètres de session.
 * Utilise le pattern ObservableObject pour une intégration fluide avec SwiftUI.
 */
@MainActor
class GameState: ObservableObject {

    enum GamePhase {
        case mainMenu
        case playing
        case paused
        case cinematics
    }

    // MARK: - Published Properties

    @Published var currentPhase: GamePhase = .mainMenu
    @Published var score: Int = 0
    @Published var discoveredLogs: [String] = []
    @Published var activeVehicleType: VehicleType = .car
    @Published var currentZoneID: String = "central_plaza"

    // MARK: - Properties

    private var cancellables = Set<AnyCancellable>()

    // MARK: - Singleton

    static let shared = GameState()

    private init() {
        setupSubscriptions()
    }

    // MARK: - Methods

    func startGame() {
        currentPhase = .playing
        print("EchoCity: Game Started")
    }

    func pauseGame() {
        currentPhase = .paused
    }

    func resumeGame() {
        currentPhase = .playing
    }

    func quitToMenu() {
        currentPhase = .mainMenu
    }

    func addLog(id: String) {
        if !discoveredLogs.contains(id) {
            discoveredLogs.append(id)
            score += 100
            print("EchoCity: New Log Discovered - \(id)")
        }
    }

    func changeVehicle(to type: VehicleType) {
        activeVehicleType = type
        print("EchoCity: Switched vehicle to \(type)")
    }

    // MARK: - Private Helpers

    private func setupSubscriptions() {
        // Logic for auto-save or analytics could go here
    }
}

enum VehicleType: String {
    case car = "4x4 SUV"
    case drone = "Drone"
    case submarine = "Submarine"
}
