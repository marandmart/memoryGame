//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Mário André Martins on 16/01/23.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    let game: GameVM = GameVM()
    var body: some Scene {
        WindowGroup {
            GameView(game: game)
        }
    }
}
