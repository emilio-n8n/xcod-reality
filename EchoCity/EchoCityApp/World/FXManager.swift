// Fichier : EchoCity/EchoCityApp/World/FXManager.swift
import RealityKit
import SwiftUI

/**
 * FXManager
 * Gère les effets visuels (particules, flashs, hologrammes temporaires).
 * En visionOS, on utilise souvent des entités avec des matériaux animés ou des séquences d'images.
 */
class FXManager {

    static let shared = FXManager()

    private init() {}

    func spawnCollectionEffect(at position: SIMD3<Float>, in root: Entity) {
        // Création d'une "explosion" de lumière simplifiée
        let mesh = MeshResource.generateSphere(radius: 0.1)
        let material = UnlitMaterial(color: .white)
        let fxEntity = ModelEntity(mesh: mesh, materials: [material])
        fxEntity.position = position
        root.addChild(fxEntity)

        // Auto-destruction après un court délai
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            fxEntity.removeFromParent()
        }
    }

    func createScanningPulse(radius: Float, duration: TimeInterval) -> Entity {
        let pulse = Entity()
        // Logic for an expanding ring material
        return pulse
    }
}
