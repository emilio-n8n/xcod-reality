// Fichier : EchoCity/EchoCityApp/Vehicles/Car.swift
import RealityKit
import Foundation

/**
 * Car
 * Implémentation du 4x4 SUV pour l'exploration terrestre.
 */
class Car: Vehicle {

    init() {
        super.init(modelName: "SUV_4x4")
        self.maxSpeed = 15.0
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    override func applyMovement(deltaTime: TimeInterval) {
        let dt = Float(deltaTime)

        // Calcul de la vitesse
        speed += throttle * dt * 5.0
        speed *= 0.98 // Friction

        // Rotation
        if abs(speed) > 0.1 {
            let rotationAngle = steering * rotationSpeed * dt * (speed / maxSpeed)
            self.orientation *= simd_quatf(angle: rotationAngle, axis: [0, 1, 0])
        }

        // Position
        let forward = self.transform.matrix.columns.2.xyz
        self.position += forward * speed * dt
    }
}

extension SIMD4<Float> {
    var xyz: SIMD3<Float> {
        return SIMD3<Float>(x, y, z)
    }
}
