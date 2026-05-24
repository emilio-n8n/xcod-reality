// Fichier : EchoCity/EchoCityApp/GameCore/WorldMap.swift
import Foundation
import Spatial

/**
 * WorldMap
 * Gère les coordonnées spatiales des points d'intérêt dans la ville.
 */
struct WorldMap {

    struct POI {
        let id: String
        let name: String
        let position: SIMD3<Float>
        let type: POIType
    }

    enum POIType: String {
        case log, landmark, missionObjective

        var name: String {
            return self.rawValue.capitalized
        }
    }

    let pointsOfInterest: [POI] = [
        POI(id: "plaza", name: "Place Centrale", position: [0, 0, 0], type: .landmark),
        POI(id: "log_001_loc", name: "Archives", position: [10, 0, -5], type: .log),
        POI(id: "dock", name: "Quais Inondés", position: [-20, -5, 30], type: .missionObjective)
    ]

    func getNearestPOI(to position: SIMD3<Float>) -> POI? {
        return pointsOfInterest.min(by: {
            simd_distance($0.position, position) < simd_distance($1.position, position)
        })
    }
}
