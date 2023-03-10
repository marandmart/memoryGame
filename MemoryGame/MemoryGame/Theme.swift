//
//  Theme.swift
//  MemoryGame
//
//  Created by Mรกrio Andrรฉ Martins on 22/01/23.
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
        cardIcons: ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "โต๏ธ", "๐ด", "๐ต"],
        numberOfPairsOfCards: 8,
        color: .green
    ),
    Theme(
        themeName: "Women",
        cardIcons: ["๐ฉ๐ปโ๐ง", "๐ง๐ฝโโ๏ธ", "๐ฉ๐ฟโ๐พ", "๐๐ปโโ๏ธ", "๐ง๐ปโโ๏ธ", "๐ฉ๐พโ๐", "๐ต๐ป", "๐๐ปโโ๏ธ", "๐ฑ๐ฟโโ๏ธ", "๐จ๐ปโโ๏ธ", "๐ฆธ๐ฝโโ๏ธ", "๐ง๐ปโโ๏ธ", "๐ฏโโ๏ธ"],
        numberOfPairsOfCards: 10,
        color: .pink
    ),
    Theme(
        themeName: "Emotions",
        cardIcons: ["๐", "๐", "๐", "๐", "๐", "โน๏ธ", "๐ฃ", "๐", "๐ซ", "๐ฉ", "๐ข", "๐ญ"],
        numberOfPairsOfCards: 12,
        color: .blue
    ),
    Theme(
        themeName: "Emojis",
        cardIcons: ["๐ฝ", "โค๏ธ", "๐ธ", "๐น", "๐บ", "๐ป", "๐", "๐ฟ", "๐พ", "๐พ", "๐ฑ", "๐", "๐โโฌ", "๐ถ", "๐ญ"],
        numberOfPairsOfCards: 9,
        color: .yellow
    ),
    Theme(
        themeName: "Professions",
        cardIcons: ["๐ฎโโ๏ธ", "๐งโ๐พ", "๐", "๐ฉโ๐", "๐จโ๐จ", "๐งโโ๏ธ", "๐ฉโ๐ป", "๐งโ๐", "๐คตโโ๏ธ"],
        numberOfPairsOfCards: 9,
        color: .brown
    ),
    Theme(
        themeName: "Love",
        cardIcons: ["๐ฉโโค๏ธโ๐จ", "๐ฉโโค๏ธโ๐ฉ", "๐", "๐จโโค๏ธโ๐จ", "๐ฉโโค๏ธโ๐โ๐จ", "๐ฉโโค๏ธโ๐โ๐ฉ", "๐", "๐จโโค๏ธโ๐โ๐จ", "๐จโ๐ฉโ๐ฆ", "๐จโ๐ฉโ๐ง", "๐จโ๐ฉโ๐งโ๐ฆ", "๐จโ๐ฉโ๐ฆโ๐ฆ"],
        numberOfPairsOfCards: 6,
        color: .red
    )
]
