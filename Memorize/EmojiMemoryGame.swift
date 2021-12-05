//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yuri Ershov on 5.12.21.
//

import SwiftUI


// ViewModel for our memorize game
class EmojiMemoryGame: ObservableObject {
    // to have emojis available before initializing, we make this constant static
    static let emojis = ["🛺", "✈️", "🚀", "🛵", "🚁", "🛸", "🛥", "🚆", "🛴", "🚗", "🚕", "🏎", "🦽", "🏍", "🚡"]
    
    // static means function is of the type itself, not the instance of emojiMemoryGame
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex] }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
     
    // MARK: - Intent(s)
     
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
