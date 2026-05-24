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
    }

    func transition(to zoneID: String) async {
        print("EchoCity: Transitioning to \(zoneID)")
        // Logic to unload current zones and load new ones
    }
}
