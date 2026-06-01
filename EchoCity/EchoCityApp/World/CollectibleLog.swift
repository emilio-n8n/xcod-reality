// Fichier : EchoCity/EchoCityApp/World/CollectibleLog.swift
import RealityKit
import SwiftUI

/**
 * CollectibleLog
 * Entité 3D représentant un log narratif à ramasser dans le monde.
 */
class CollectibleLog: Entity {

    let logID: String
    private var isCollected: Bool = false

    init(id: String, position: SIMD3<Float>) {
        self.logID = id
        super.init()
        self.position = position
        self.name = "Log_\(id)"

        setupVisuals()
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    private func setupVisuals() {
        // Un petit cube holographique tournant
        let mesh = MeshResource.generateBox(size: 0.3)
        let material = SimpleMaterial(color: .cyan.withAlphaComponent(0.6), isMetallic: false)
        let model = ModelEntity(mesh: mesh, materials: [material])

        // Ajout d'une composante de collision pour le tap
        model.components.set(CollisionComponent(shapes: [.generateBox(size: 0.3)]))
        model.components.set(InputTargetComponent())

        addChild(model)

        // Animation simple de rotation (via une composante de rotation si implémentée,
        // ou via la boucle de mise à jour)
    }

    func collect() {
        guard !isCollected else { return }
        isCollected = true

        // Notification au GameState
        DispatchQueue.main.async {
            GameState.shared.addLog(id: self.logID)
        }

        // Effet visuel de disparition
        self.removeFromParent()

        // Son de collecte
        AudioManager.shared.playSound(.logDiscovered)
    }
}
