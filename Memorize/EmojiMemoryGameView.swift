//
//  ContentView.swift
//  Memorize
//
//  Created by Yuri Ershov on 19.11.21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //When something changed - rebuild body
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                ForEach (game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
.previewInterfaceOrientation(.portrait)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            ZStack {
                if card.isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    shape
                    // Strokes inside of the shape instead of simple stroke
                        .strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        })
    }
    
    // A function to make a clean look to our cardView
    // Making a font size is minimum from height or width of card size and slightly less
    // using geometry parameters.
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}
