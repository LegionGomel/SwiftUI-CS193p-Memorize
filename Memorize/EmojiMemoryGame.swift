//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yuri Ershov on 5.12.21.
//

import SwiftUI


// ViewModel for our memorize game
class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    // to have emojis available before initializing, we make this constant static
    private static let emojis = ["🛺", "✈️", "🚀", "🛵", "🚁", "🛸", "🛥", "🚆", "🛴", "🚗", "🚕", "🏎", "🦽", "🏍", "🚡"]
    
    // static means function is of the type itself, not the instance of emojiMemoryGame
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex] }
    }
    
    @Published private var model = createMemoryGame()
    
    
    var cards: Array<Card> {
        model.cards
    }
    
     
    // MARK: - Intent(s)
     
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}
