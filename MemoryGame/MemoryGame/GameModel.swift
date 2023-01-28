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
    
    private var indexOfAlreadyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.onlyOne }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
        
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isMatched,
           !cards[chosenIndex].isFaceUp
        {
            cards[chosenIndex].isFaceUp = true
            if let possibleMatchIndex = indexOfAlreadyFaceUpCard {
                if cards[chosenIndex].content == cards[possibleMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[possibleMatchIndex].isMatched = true
                }
            } else {
                indexOfAlreadyFaceUpCard = chosenIndex
            }
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

extension Array {
    var onlyOne: Element? {
        // self implícito
        count == 1 ? first : nil
    }
}

