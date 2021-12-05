//
//  ContentView.swift
//  Memorize
//
//  Created by Yuri Ershov on 19.11.21.
//

import SwiftUI

struct ContentView: View {
    //When something changed - rebuild body
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                /* Because our Strings of emojis cant be identifiable my themselves,
                 we need to specify an id's for all of them. So we pointing to SELF
                 in such manner, that ste STRINGS will me as ID's for views. In this
                 case if in array will be tho same emojis, same view will rendered twice
                 and reacts on click on one or another with same behavious (clone cards
                 with same behaviour)*/
                ForEach (viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
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
        ContentView(viewModel: game)
.previewInterfaceOrientation(.portrait)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                // Strokes inside of the shape instead of simple stroke
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}
