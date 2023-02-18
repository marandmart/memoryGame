//
//  ContentView.swift
//  MemoryGame
//
//  Created by Mário André Martins on 16/01/23.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var game: GameVM
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        VStack(spacing: 0){
            title
            cardScroll
            gameButtons
        }
    }
    
    var cardScroll: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(game.cards) { card in
                    cardView(for: card)
                }
            }
            .padding(.top, 30.0)
        }
        .padding(.horizontal)
    }
    
    var title: some View {
        Text("Memory Game")
            .font(Font.system(size: ViewConstants.titleFontSize, weight: ViewConstants.titleFontWeight))
            .foregroundColor(ViewConstants.titleColor)
    }
    
    struct Cardify: AnimatableModifier {
                
        init(isFaceUp: Bool){
            rotation = isFaceUp ? 180 : 0
        }
        
        var rotation: Double
        
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
                    .opacity(rotation < 90 ? 0 : 1)
            }
            .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
        }
    }
    
    @ViewBuilder
    private func cardView(for card: GameModel<String>.Card) -> some View {
        if card.isMatched && !card.isFaceUp{
            Text(card.content)
                .font(Font.system(size: CardValues.contentSize))
                .cardify(isFaceUp: true)
        } else {
            Text(card.content)
                .font(Font.system(size: CardValues.contentSize))
                .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                .animation(.easeIn, value: card.isMatched)
                .cardify(isFaceUp: card.isFaceUp)
                .onTapGesture {
                    withAnimation{
                        game.choose(card)
                    }
                }
        }
    }
    
    var gameButtons: some View {
        HStack{
            Button("New Game"){
                game.newGame()
            }
            .font(Font.system(size: ViewConstants.newGameButtonSize))
            .padding(.top)
        }
    }
    
    
    private struct CardValues {
        static let cornerSize: CGFloat = 8
        static let backsideColor: Color = .red
        static let aspectRatio: CGFloat = 2/3
        static let contentSize: CGFloat = 50
        static let cardLinewidth: CGFloat = 5
        
        // pie
        static let pieColor: Color = .red
        static let pieColorOpacity: Double = 0.8
        static let pieScalingFactor: Double = 0.75
    }
    
    private struct ViewConstants {
        static let newGameButtonSize: CGFloat = 20
        static let titleColor: Color = .blue
        static let titleFontSize: CGFloat = 32
        static let titleFontWeight: Font.Weight = .bold
    }
    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(GameView.Cardify(isFaceUp: isFaceUp))
    }
}


struct ContentView_Previews: PreviewProvider {
    static let game = GameVM()
    static var previews: some View {
        GameView(game: game)
    }
}
