//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yuri Ershov on 19.11.21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    // let for constant POINTER to our class (that can have changes inside of it)
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
