//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yuri Ershov on 5.12.21.
//

import Foundation


// A model for our memorize game
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    // Init for struct with function (createCardCOntent) as an argument to create a card content
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        // here we use generics (don't care type) for future use by various types
        var content: CardContent
    }
}
