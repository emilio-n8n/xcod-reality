// Fichier : EchoCity/EchoCityApp/Vehicles/Drone.swift
import RealityKit
import Foundation

/**
 * Drone
 * Véhicule aérien pour l'exploration verticale et le scanning.
 */
class Drone: Vehicle {

    var altitude: Float = 0
    var targetAltitude: Float = 5.0

    init() {
        super.init(modelName: "Exploration_Drone")
        self.maxSpeed = 20.0
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    override func applyMovement(deltaTime: TimeInterval) {
        let dt = Float(deltaTime)

        // Mouvement horizontal
        let forward = self.transform.matrix.columns.2.xyz
        let right = self.transform.matrix.columns.0.xyz

        speed += throttle * dt * 10.0
        speed *= 0.95 // Air resistance

        self.position += forward * speed * dt

        // Stabilisation d'altitude
        let altitudeError = targetAltitude - self.position.y
        self.position.y += altitudeError * dt * 2.0

        // Rotation
        let rotationAngle = steering * rotationSpeed * dt * 2.0
        self.orientation *= simd_quatf(angle: rotationAngle, axis: [0, 1, 0])
    }
}
