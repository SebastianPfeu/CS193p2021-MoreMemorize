//
//  EmojiMemoryGame.swift
//  MoreMemorize
//
//  Created by Sebastian Pfeufer on 11.04.22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static var themes: Array<Theme> = [
        Theme(
            name: "Vehicles",
            emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚁", "🛸", "🚀", "🛶", "⛵️", "🚤", "🛥", "🛳", "⛴", "🚢", "🚜", "🚛"],
            numberOfPairsOfCards: 5,
            color: "red"
        ),
        Theme(
            name: "Animals",
            emojis: ["🐶", "🐱", "🐭", "🐹", "🦊", "🐼", "🐯", "🦁", "🐸", "🐒", "🐥", "🦅", "🦇", "🪱", "🦄", "🐞"],
            numberOfPairsOfCards: 8,
            color: "blue"
        ),
        Theme(
            name: "Buildings",
            emojis: ["🏠", "🏭", "🏢", "🏣", "🏥", "🏨", "🏛", "⛪️", "🕌", "🛕", "🏚", "🛖"],
            numberOfPairsOfCards: 7,
            color: "green"
        ),
        Theme(
            name: "Sports",
            emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸"],
            numberOfPairsOfCards: 6,
            color: "yellow"
        ),
        Theme(
            name: "Flags",
            emojis: ["🇦🇺", "🇧🇪", "🇧🇦", "🇧🇷", "🇧🇬", "🇨🇳", "🇨🇮", "🇩🇰", "🇩🇪", "🇪🇪", "🇫🇷", "🇬🇷"],
            numberOfPairsOfCards: 6,
            color: "purple"
        ),
        Theme(
            name: "Buildings",
            emojis: ["😀", "😁", "😅", "😂", "🥲", "☺️", "😇", "😉", "😍"],
            numberOfPairsOfCards: 9,
            color: "orange"
        )
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in theme.emojis[pairIndex] }
    }
    
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
    var themeName: String {
        return theme.name
    }
    
    var score: Int {
        return model.score
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
