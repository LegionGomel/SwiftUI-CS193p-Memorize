//
//  ContentView.swift
//  Memorize
//
//  Created by Yuri Ershov on 19.11.21.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = ["🛺", "✈️", "🚀", "🛵", "🚁", "🛸", "🛥", "🚆", "🛴", "🚗", "🚕", "🏎", "🦽", "🏍", "🚡"]
    
    @State var emojiCount = 8
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    /* Because our Strings of emojis cant be identifiable my themselves,
                     we need to specify an id's for all of them. So we pointing to SELF
                     in such manner, that ste STRINGS will me as ID's for views. In this
                     case if in array will be tho same emojis, same view will rendered twice
                     and reacts on click on one or another with same behavious (clone cards
                     with same behaviour)*/
                    ForEach (emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding(.horizontal)
                .foregroundColor(.red)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}

struct CardView: View {
    
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                // Strokes inside of the shape instead of simple stroke
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
