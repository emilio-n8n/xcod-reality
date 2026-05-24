// Fichier : EchoCity/EchoCityApp/Utilities/Extensions.swift
import RealityKit
import Spatial

/**
 * Extensions
 * Ajoute des fonctionnalités pratiques aux types existants.
 */
extension Entity {
    func findChild(named name: String) -> Entity? {
        return children.first(where: { $0.name == name }) ?? children.compactMap({ $0.findChild(named: name) }).first
    }
}

extension SIMD3 where Scalar == Float {
    static var zero: SIMD3<Float> { SIMD3<Float>(0, 0, 0) }

    var length: Float {
        return sqrt(x*x + y*y + z*z)
    }
}
