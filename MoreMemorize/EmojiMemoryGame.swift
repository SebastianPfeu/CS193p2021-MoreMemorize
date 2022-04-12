//
//  EmojiMemoryGame.swift
//  MoreMemorize
//
//  Created by Sebastian Pfeufer on 11.04.22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let vehicles = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚁", "🛸", "🚀", "🛶", "⛵️", "🚤", "🛥", "🛳", "⛴", "🚢", "🚜", "🚛"]
//    static let animals = ["🐶", "🐱", "🐭", "🐹", "🦊", "🐼", "🐯", "🦁", "🐸", "🐒", "🐥", "🦅", "🦇", "🪱", "🦄", "🐞"]
//    static let buildings = ["🏠", "🏭", "🏢", "🏣", "🏥", "🏨", "🏛", "⛪️", "🕌", "🛕", "🏚", "🛖"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in vehicles[pairIndex] }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
