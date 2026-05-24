// Fichier : EchoCity/EchoCityApp/UI/OptionsMenu.swift
import SwiftUI

/**
 * OptionsMenu
 * Paramètres du jeu.
 */
struct OptionsMenu: View {
    @State private var soundVolume: Double = 0.8
    @State private var musicVolume: Double = 0.5
    @State private var showSubtitles: Bool = true

    var body: some View {
        Form {
            Section("Audio") {
                Slider(value: $soundVolume, in: 0...1) {
                    Text("Effets")
                }
                Slider(value: $musicVolume, in: 0...1) {
                    Text("Musique")
                }
            }

            Section("Narration") {
                Toggle("Sous-titres", isOn: $showSubtitles)
            }
        }
        .navigationTitle("Options")
        .frame(width: 400, height: 300)
    }
}
