// Fichier : EchoCity/EchoCityApp/Utilities/Helpers.swift
import Foundation
import RealityKit

/**
 * Helpers
 * Fonctions utilitaires diverses.
 */
struct Helpers {
    static func formatTime(_ seconds: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: seconds) ?? "00:00"
    }

    static func randomVector(in range: ClosedRange<Float>) -> SIMD3<Float> {
        return SIMD3<Float>(
            Float.random(in: range),
            Float.random(in: range),
            Float.random(in: range)
        )
    }
}
