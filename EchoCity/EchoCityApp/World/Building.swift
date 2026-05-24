// Fichier : EchoCity/EchoCityApp/World/Building.swift
import RealityKit

/**
 * Building
 * Représente un bâtiment interactif ou décoratif.
 */
class Building: Entity {

    enum BuildingType {
        case residential, commercial, administrative, industrial
    }

    init(type: BuildingType, height: Float, position: SIMD3<Float>) {
        super.init()
        self.position = position

        let mesh = MeshResource.generateBox(size: [5, height, 5])
        let material = SimpleMaterial(color: .gray, isMetallic: true)
        let model = ModelEntity(mesh: mesh, materials: [material])

        addChild(model)

        // Add physics for collisions with vehicles
        model.components.set(CollisionComponent(shapes: [.generateBox(size: [5, height, 5])]))
    }

    required init() {
        fatalError("init() has not been implemented")
    }
}
