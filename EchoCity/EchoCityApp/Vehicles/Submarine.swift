// Fichier : EchoCity/EchoCityApp/Vehicles/Submarine.swift
import RealityKit
import Foundation

/**
 * Submarine
 * Véhicule pour explorer les zones inondées et les tunnels sous-marins.
 */
class Submarine: Vehicle {

    var depth: Float = 0

    init() {
        super.init(modelName: "Mini_Sub")
        self.maxSpeed = 8.0
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    override func applyMovement(deltaTime: TimeInterval) {
        let dt = Float(deltaTime)

        // Propulsion
        let forward = self.transform.matrix.columns.2.xyz
        speed += throttle * dt * 3.0
        speed *= 0.99 // Water drag

        self.position += forward * speed * dt

        // Contrôle de la profondeur
        let targetY = -abs(depth) // Le sous-marin reste sous l'eau
        let currentY = self.position.y
        self.position.y += (targetY - currentY) * dt * 1.5

        // Rotation
        let rotationAngle = steering * rotationSpeed * dt
        self.orientation *= simd_quatf(angle: rotationAngle, axis: [0, 1, 0])
    }
}
