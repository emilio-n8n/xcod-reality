// Fichier : EchoCity/EchoCityApp/EchoCityGame.swift
import RealityKit
import SwiftUI
import Combine

/**
 * EchoCityGame
 * Contrôleur principal de la simulation RealityKit.
 * Fait le pont entre les entités et la logique de jeu.
 */
@MainActor
class EchoCityGame: ObservableObject {

    private var city: City?
    private var activeVehicle: Vehicle?
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupStateSubscriptions()
    }

    func setupScene(_ content: RealityViewContent) async {
        // Initialisation de la ville
        let rootCity = City()
        await rootCity.setupInitialScene()
        content.add(rootCity)
        self.city = rootCity

        // Initialisation du véhicule par défaut
        spawnVehicle(type: .car, in: rootCity)

        // Démarrage de la boucle de mise à jour (approximation pour l'exemple)
        startUpdateLoop()
    }

    private func spawnVehicle(type: VehicleType, in root: Entity) {
        activeVehicle?.removeFromParent()

        switch type {
        case .car:
            activeVehicle = Car()
        case .drone:
            activeVehicle = Drone()
        case .submarine:
            activeVehicle = Submarine()
        }

        if let vehicle = activeVehicle {
            vehicle.position = [0, 0, 5] // Position de spawn
            root.addChild(vehicle)
        }
    }

    private func setupStateSubscriptions() {
        GameState.shared.$activeVehicleType
            .sink { [weak self] newType in
                guard let self = self, let city = self.city else { return }
                self.spawnVehicle(type: newType, in: city)
            }
            .store(in: &cancellables)
    }

    private func startUpdateLoop() {
        // En production, on utiliserait SceneEvents.Update ou un DisplayLink
        Timer.publish(every: 1/60, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.update(deltaTime: 1/60)
            }
            .store(in: &cancellables)
    }

    private func update(deltaTime: TimeInterval) {
        activeVehicle?.update(deltaTime: deltaTime)
    }
}
