//
//  GameVM.swift
//  MemoryGame
//
//  Created by Mário André Martins on 16/01/23.
//

import SwiftUI

class GameVM: ObservableObject {
    typealias Card = GameModel<String>.Card
    
    private static func createGame() -> GameModel<String> {
        // tratar
        let themeData: Theme = gameThemes.randomElement()!
        var gameCardContent: [Card] = Array<Card>()
        for index in themeData.themeContent.indices {
            let card1: Card = Card(content: themeData.themeContent[index], id: index*2)
            let card2: Card = Card(content: themeData.themeContent[index], id: index*2+1)
            gameCardContent.append(contentsOf: [card1, card2])
        }
        return GameModel(cards: gameCardContent)
    }

    @Published private var modelInstance: GameModel<String> = createGame()
    
    var cards: [Card] {
        modelInstance.cards
    }
    
    // Mark: - Intent(s)
    
}
