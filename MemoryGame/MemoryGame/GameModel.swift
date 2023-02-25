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
            if let possibleMatchIndex = indexOfAlreadyFaceUpCard {
                if cards[chosenIndex].content == cards[possibleMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[possibleMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfAlreadyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(cardIcons: Array<CardContent>){
        var gameContent: [Card] = Array<Card>()
        for index in cardIcons.indices {
            let card1 = Card(content: cardIcons[index], id: index*2)
            let card2 = Card(content: cardIcons[index], id: index*2+1)
            gameContent.append(contentsOf: [card1, card2])
        }
        gameContent.shuffle()
        self.cards = gameContent
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

