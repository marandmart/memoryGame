//
//  GameModel.swift
//  MemoryGame
//
//  Created by Mário André Martins on 16/01/23.
//

import Foundation
import SwiftUI

struct GameModel<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    private var indexOfAlreadyFaceUpCard: Int?
        
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if let possibleMatchIndex = indexOfAlreadyFaceUpCard {
                if cards[chosenIndex].content == cards[possibleMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[possibleMatchIndex].isMatched = true
                }
                indexOfAlreadyFaceUpCard = nil
            } else {
                for cardIndex in cards.indices {
                    cards[cardIndex].isFaceUp = false
                }
                indexOfAlreadyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
        }
    }
    
    init(cards: Array<Card>) {
        self.cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        
        let id: Int
    }

    
}
