//
//  GameVM.swift
//  MemoryGame
//
//  Created by Mário André Martins on 16/01/23.
//

import SwiftUI

class GameVM: ObservableObject {
    typealias Card = GameModel<String>.Card
    
    static var themeData: Theme {
        get { gameThemes.randomElement() ?? gameThemes[0] }
    }
    
    private static func createGame() -> GameModel<String> {
        GameModel(cardIcons: themeData.cardIcons)
    }

    @Published private var modelInstance: GameModel<String> = createGame()
    
    var cards: [Card] {
        modelInstance.cards
    }
    
    // Mark: - Intent(s)
    func choose(_ card: Card){
        modelInstance.choose(card)
    }
    
    func newGame(){
        modelInstance = GameVM.createGame()
    }
}
