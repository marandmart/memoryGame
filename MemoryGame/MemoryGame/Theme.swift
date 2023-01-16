//
//  Theme.swift
//  MemoryGame
//
//  Created by Mário André Martins on 22/01/23.
//

import SwiftUI

struct Theme {
    let themeName: String
    var themeContent: [String]
    let numberOfPairsOfCards: Int
    let color: Color
    
    init(themeName: String, themeCards: [String], numberOfPairsOfCards: Int, color: Color) {
        self.themeName = themeName
        self.themeContent = themeCards
        self.numberOfPairsOfCards = numberOfPairsOfCards > themeCards.count ? themeCards.count : numberOfPairsOfCards
        self.color = color
    }
    
}

var gameThemes: Array<Theme> = [
    Theme(
        themeName: "Vehicles",
        themeCards: ["🚀", "🚁", "🚂", "🚃", "🚅", "🚇", "🚈", "🚕", "🚙", "🚝", "🚑", "⛵️", "🛴", "🛵"],
        numberOfPairsOfCards: 8,
        color: .green
    ),
    Theme(
        themeName: "Women",
        themeCards: ["👩🏻‍🔧", "🧗🏽‍♀️", "👩🏿‍🌾", "🏋🏻‍♀️", "🧚🏻‍♀️", "👩🏾‍🚀", "👵🏻", "🏄🏻‍♀️", "👱🏿‍♀️", "👨🏻‍✈️", "🦸🏽‍♀️", "🧏🏻‍♂️", "👯‍♀️"],
        numberOfPairsOfCards: 10,
        color: .pink
    ),
    Theme(
        themeName: "Emotions",
        themeCards: ["😞", "😔", "😟", "😕", "🙁", "☹️", "😣", "😖", "😫", "😩", "😢", "😭"],
        numberOfPairsOfCards: 12,
        color: .blue
    ),
    Theme(
        themeName: "Emojis",
        themeCards: ["😽", "❤️", "😸", "😹", "😺", "😻", "🙀", "😿", "😾", "🐾", "🐱", "🐈", "🐈‍⬛", "🐶", "🌭"],
        numberOfPairsOfCards: 9,
        color: .yellow
    ),
    Theme(
        themeName: "Professions",
        themeCards: ["👮‍♀️", "🧑‍🌾", "💂", "👩‍🚒", "👨‍🎨", "🧑‍✈️", "👩‍💻", "🧑‍🚀", "🤵‍♂️"],
        numberOfPairsOfCards: 9,
        color: .brown
    ),
    Theme(
        themeName: "Love",
        themeCards: ["👩‍❤️‍👨", "👩‍❤️‍👩", "💑", "👨‍❤️‍👨", "👩‍❤️‍💋‍👨", "👩‍❤️‍💋‍👩", "💏", "👨‍❤️‍💋‍👨", "👨‍👩‍👦", "👨‍👩‍👧", "👨‍👩‍👧‍👦", "👨‍👩‍👦‍👦"],
        numberOfPairsOfCards: 6,
        color: .red
    )
]
