// Fichier : EchoCity/EchoCityApp/World/Environment.swift
import RealityKit

/**
 * Environment
 * Gère les effets atmosphériques, le ciel et la météo.
 */
class Environment: Entity {

    @MainActor
    init(skyboxName: String? = nil) {
        super.init()

        setupAtmosphere()
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    private func setupAtmosphere() {
        // ImageBasedLight pour un rendu réaliste
        // Note: En production, le chargement doit être asynchrone via .loadAsync

        Task {
            if let texture = try? await TextureResource.load(named: "Skybox") {
                let iblComponent = ImageBasedLightComponent(source: .single(texture))
                self.components.set(iblComponent)
                self.components.set(ImageBasedLightReceiverComponent(imageBasedLight: self))
                print("EchoCity: Atmosphere loaded")
            }
        }
    }
}
