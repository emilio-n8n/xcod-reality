// Fichier : EchoCity/EchoCityApp/GameCore/InputManager.swift
import Foundation
import Combine

/**
 * InputManager
 * Gère les entrées utilisateur et les traduit en commandes de jeu (throttle, steering, etc.).
 * Supporte potentiellement plusieurs types d'entrées (gestes, manettes).
 */
class InputManager: ObservableObject {

    static let shared = InputManager()

    // MARK: - Inputs
    @Published var throttle: Float = 0
    @Published var steering: Float = 0
    @Published var lift: Float = 0 // Pour le drone/sous-marin

    private init() {}

    // MARK: - Methods

    func resetInputs() {
        throttle = 0
        steering = 0
        lift = 0
    }

    /// Traduit une entrée de joystick virtuel (UI) en commandes
    func updateFromVirtualJoystick(x: Float, y: Float) {
        steering = x
        throttle = y
    }

    /// Traduit une entrée de hauteur (UI) en commandes
    func updateLift(value: Float) {
        lift = value
    }
}
