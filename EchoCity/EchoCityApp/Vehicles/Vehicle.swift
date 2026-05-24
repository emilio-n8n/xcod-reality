// Fichier : EchoCity/EchoCityApp/Vehicles/Vehicle.swift
import RealityKit
import Combine

/**
 * Vehicle
 * Classe de base abstraite pour tous les véhicules du jeu.
 */
class Vehicle: Entity {

    var speed: Float = 0
    var maxSpeed: Float = 10
    var rotationSpeed: Float = 0.5

    // État de contrôle
    var throttle: Float = 0
    var steering: Float = 0

    init(modelName: String) {
        super.init()
        self.name = "Vehicle_\(modelName)"
        loadModel(named: modelName)
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    private func loadModel(named name: String) {
        // Placeholder pour le chargement d'asset
        let mesh = MeshResource.generateBox(size: [1, 0.5, 2])
        let material = SimpleMaterial(color: .blue, isMetallic: true)
        let model = ModelEntity(mesh: mesh, materials: [material])
        addChild(model)

        // Setup collision
        self.components.set(CollisionComponent(shapes: [.generateBox(size: [1, 0.5, 2])]))
    }

    func update(deltaTime: TimeInterval) {
        // Logique de mouvement de base (à surcharger)
        applyMovement(deltaTime: deltaTime)
    }

    func applyMovement(deltaTime: TimeInterval) {
        // Implémentation générique
    }
}
