// Fichier : EchoCity/EchoCityApp/Audio/SoundEffect.swift
import Foundation

/**
 * SoundEffect
 * Enumération des ressources audio disponibles.
 */
enum SoundEffect {
    case engineStart
    case engineLoop
    case logDiscovered
    case uiClick
    case droneHum
    case waterSplash

    var fileName: String {
        switch self {
        case .engineStart: return "car_start.wav"
        case .engineLoop: return "car_idle_loop.wav"
        case .logDiscovered: return "collect_log.mp3"
        case .uiClick: return "click.caf"
        case .droneHum: return "drone_ambiance.wav"
        case .waterSplash: return "splash.wav"
        }
    }
}
