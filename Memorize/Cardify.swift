//
//  Cardify.swift
//  Memorize
//
//  Created by Yuri Ershov on 8.12.21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    // Feels the same as it was, but different when we need an animation for card
    init (isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    // To get and set animatabledata and wride inside of our code
    // Rotation var instead of it. Also animate rotation data, to make our
    // animation work as intended. AnimatableData used as a computed property.
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double // in degrees
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                
            } else {
                shape.fill()
            }
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}
