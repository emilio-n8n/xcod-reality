// Fichier : EchoCity/EchoCityApp/Utilities/Constants.swift
import Foundation

/**
 * Constants
 * Centralise les valeurs magiques et configurations.
 */
struct Constants {
    struct World {
        static let gravity: Float = -9.81
        static let defaultAtmosphereIntensity: Float = 1.0
    }

    struct Gameplay {
        static let interactionDistance: Float = 5.0
        static let maxLogs: Int = 50
    }

    struct UI {
        static let cornerRadius: CGFloat = 20.0
        static let padding: CGFloat = 16.0
    }
}
