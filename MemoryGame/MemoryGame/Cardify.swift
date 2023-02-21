//
//  Cardify.swift
//  MemoryGame
//
//  Created by Mário André Martins on 21/02/23.
//

import SwiftUI

struct Cardify: AnimatableModifier {
            
    init(isFaceUp: Bool, isMatched: Bool){
        rotation = isFaceUp ? 180 : 0
        self.isMatched = isMatched
    }
    
    var rotation: Double
    var isMatched: Bool
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: CardValues.cornerSize)
        ZStack{
            if rotation < 90 {
                shape
                    .fill(CardValues.backsideColor)
                    .aspectRatio(CardValues.aspectRatio, contentMode: .fit)
            } else {
                shape
                    .strokeBorder(CardValues.backsideColor, lineWidth: CardValues.cardLinewidth)
                    .aspectRatio(CardValues.aspectRatio, contentMode: .fit)
                Pie(start: 0, end: 360, scalingFactor: CardValues.pieScalingFactor)
                    .foregroundColor(CardValues.pieColor)
            }
            content
                .font(Font.system(size: CardValues.contentSize))
                .opacity(rotation < 90 ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
        .rotationEffect(Angle.degrees(isMatched ? 360 : 0))
        .animation(.easeIn.delay(0.5), value: isMatched)
    }
    
    private struct CardValues {
        static let cornerSize: CGFloat = 8
        static let backsideColor: Color = .red
        static let aspectRatio: CGFloat = 2/3
        static let contentSize: CGFloat = 35
        static let cardLinewidth: CGFloat = 5
        
        // pie
        static let pieColor: Color = .red
        static let pieColorOpacity: Double = 0.8
        static let pieScalingFactor: Double = 0.75

    }
}

extension View {
    func cardify(isFaceUp: Bool, isMatched: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp, isMatched: isMatched))
    }
}
