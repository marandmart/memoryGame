//
//  GameModel.swift
//  MemoryGame
//
//  Created by Mário André Martins on 16/01/23.
//

import Foundation
import SwiftUI

struct GameModel<CardContent> {
    
    private(set) var cards: Array<Card>
        
    mutating func choose(card: Card){
        
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
