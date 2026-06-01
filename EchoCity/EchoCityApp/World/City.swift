// Fichier : EchoCity/EchoCityApp/World/City.swift
import RealityKit
import SwiftUI

/**
 * City
 * Entité racine représentant la ville entière.
 * Gère le chargement asynchrone des zones et l'optimisation (LOD).
 */
class City: Entity {

    private var zones: [Zone] = []

    @MainActor
    required init() {
        super.init()
        self.name = "EchoCity_Root"
    }

    func setupInitialScene() async {
        // Chargement de la place centrale par défaut
        let mainZone = Zone(id: "central_plaza", name: "Central Plaza")
        addChild(mainZone)
        zones.append(mainZone)

        // Ajout d'un éclairage global
        let light = PointLight()
        light.light.intensity = 1000
        light.position = [0, 10, 0]
        addChild(light)

        // Spawn de quelques logs
        spawnLogs()
    }

    private func spawnLogs() {
        let logPositions: [(String, SIMD3<Float>)] = [
            ("log_001", [5, 0.5, -5]),
            ("log_002", [-8, 0.5, 3]),
            ("log_003", [2, -2, 15]) // Inondé (pour sub)
        ]

        for (id, pos) in logPositions {
            let logEntity = CollectibleLog(id: id, position: pos)
            addChild(logEntity)
        }
    }

    func transition(to zoneID: String) async {
        print("EchoCity: Transitioning to \(zoneID)")
        // Logic to unload current zones and load new ones
    }
}
