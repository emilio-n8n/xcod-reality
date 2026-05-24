// Fichier : EchoCity/EchoCityApp/World/Street.swift
import RealityKit

/**
 * Street
 * Gère les routes et les chemins navigables par le 4x4.
 */
class Street: Entity {

    init(from start: SIMD3<Float>, to end: SIMD3<Float>) {
        super.init()

        let distance = simd_distance(start, end)
        let mesh = MeshResource.generatePlane(width: 4, depth: distance)
        let material = SimpleMaterial(color: .black, isMetallic: false)
        let road = ModelEntity(mesh: mesh, materials: [material])

        road.position = (start + end) / 2
        road.look(at: end, from: road.position, relativeTo: nil)

        addChild(road)
    }

    required init() {
        fatalError("init() has not been implemented")
    }
}
