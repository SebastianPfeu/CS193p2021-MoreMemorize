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
            name: "vehicles",
            emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚁", "🛸", "🚀", "🛶", "⛵️", "🚤", "🛥", "🛳", "⛴", "🚢", "🚜", "🚛"],
            numberOfPairsOfCards: 5,
            color: "red"
        ),
        Theme(
            name: "animals",
            emojis: ["🐶", "🐱", "🐭", "🐹", "🦊", "🐼", "🐯", "🦁", "🐸", "🐒", "🐥", "🦅", "🦇", "🪱", "🦄", "🐞"],
            numberOfPairsOfCards: 8,
            color: "blue"
        ),
        Theme(
            name: "buildings",
            emojis: ["🏠", "🏭", "🏢", "🏣", "🏥", "🏨", "🏛", "⛪️", "🕌", "🛕", "🏚", "🛖"],
            numberOfPairsOfCards: 7,
            color: "green"
        )
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in theme.emojis[pairIndex] }
    }
    
    @Published private var model: MemoryGame<String>
    
    private var theme: Theme
    
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
