// Fichier : EchoCity/EchoCityApp/World/Zone.swift
import RealityKit

/**
 * Zone
 * Subdivision de la ville (ex: Quartier Industriel, Centre-Ville).
 */
class Zone: Entity {
    let id: String

    init(id: String, name: String) {
        self.id = id
        super.init()
        self.name = "Zone_\(name)"

        generatePlaceholderTerrain()
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    private func generatePlaceholderTerrain() {
        // Création d'un plan de sol pour le debug/placeholder
        let mesh = MeshResource.generatePlane(width: 100, depth: 100)
        let material = SimpleMaterial(color: .darkGray, isMetallic: false)
        let ground = ModelEntity(mesh: mesh, materials: [material])
        ground.physicsBody = PhysicsBodyComponent(shapes: [.generateBox(size: [100, 0.1, 100])], mass: 0, mode: .static)
        addChild(ground)
    }
}
