//
//  Theme.swift
//  MemoryGame
//
//  Created by Mário André Martins on 22/01/23.
//

import SwiftUI

struct Theme {
    let themeName: String
    var cardIcons: [String]
    let numberOfPairsOfCards: Int
    let color: Color
    
    init(themeName: String, cardIcons: [String], numberOfPairsOfCards: Int, color: Color) {
        self.themeName = themeName
        self.cardIcons = cardIcons
        self.numberOfPairsOfCards = numberOfPairsOfCards > cardIcons.count ? cardIcons.count : numberOfPairsOfCards
        self.color = color
    }
    
}

var gameThemes: Array<Theme> = [
    Theme(
        themeName: "Vehicles",
        cardIcons: ["🚀", "🚁", "🚂", "🚃", "🚅", "🚇", "🚈", "🚕", "🚙", "🚝", "🚑", "⛵️", "🛴", "🛵"],
        numberOfPairsOfCards: 8,
        color: .green
    ),
    Theme(
        themeName: "Women",
        cardIcons: ["👩🏻‍🔧", "🧗🏽‍♀️", "👩🏿‍🌾", "🏋🏻‍♀️", "🧚🏻‍♀️", "👩🏾‍🚀", "👵🏻", "🏄🏻‍♀️", "👱🏿‍♀️", "👨🏻‍✈️", "🦸🏽‍♀️", "🧏🏻‍♂️", "👯‍♀️"],
        numberOfPairsOfCards: 10,
        color: .pink
    ),
    Theme(
        themeName: "Emotions",
        cardIcons: ["😞", "😔", "😟", "😕", "🙁", "☹️", "😣", "😖", "😫", "😩", "😢", "😭"],
        numberOfPairsOfCards: 12,
        color: .blue
    ),
    Theme(
        themeName: "Emojis",
        cardIcons: ["😽", "❤️", "😸", "😹", "😺", "😻", "🙀", "😿", "😾", "🐾", "🐱", "🐈", "🐈‍⬛", "🐶", "🌭"],
        numberOfPairsOfCards: 9,
        color: .yellow
    ),
    Theme(
        themeName: "Professions",
        cardIcons: ["👮‍♀️", "🧑‍🌾", "💂", "👩‍🚒", "👨‍🎨", "🧑‍✈️", "👩‍💻", "🧑‍🚀", "🤵‍♂️"],
        numberOfPairsOfCards: 9,
        color: .brown
    ),
    Theme(
        themeName: "Love",
        cardIcons: ["👩‍❤️‍👨", "👩‍❤️‍👩", "💑", "👨‍❤️‍👨", "👩‍❤️‍💋‍👨", "👩‍❤️‍💋‍👩", "💏", "👨‍❤️‍💋‍👨", "👨‍👩‍👦", "👨‍👩‍👧", "👨‍👩‍👧‍👦", "👨‍👩‍👦‍👦"],
        numberOfPairsOfCards: 6,
        color: .red
    )
]
