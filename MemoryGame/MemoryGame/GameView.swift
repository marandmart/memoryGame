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
        VStack{
            title
            cardScroll
            gameButtons
        }
    }
    
    var cardScroll: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(game.cards) { card in
                    cardView(for: card)
                }
            }
        }
        .padding()
    }
    
    var title: some View {
        Text("Memory Game")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(ViewConstants.titleColor)
            .padding(.top)
    }
    
    struct Cardify: ViewModifier {
        let isFaceUp: Bool
        
        func body(content: Content) -> some View {
            let shape = RoundedRectangle(cornerRadius: CardValues.cornerSize)
            ZStack{
                if isFaceUp {
                    shape
                        .strokeBorder(CardValues.backsideColor, lineWidth: CardValues.cornerSize)
                        .aspectRatio(CardValues.aspectRatio, contentMode: .fit)
                    Pie(start: 0, end: 360, scalingFactor: 0.85)
                        .foregroundColor(CardValues.pieColor)
                        .opacity(CardValues.pieColorOpacity)
                } else {
                    shape
                        .fill(CardValues.backsideColor)
                        .aspectRatio(CardValues.aspectRatio ,contentMode: .fit)
                }
                content
                    .opacity(isFaceUp ? 1 : 0)
            }
        }
    }
    
    @ViewBuilder
    private func cardView(for card: GameModel<String>.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Text(card.content)
                .cardify(isFaceUp: true)
        } else {
            Text(card.content)
                .font(Font.system(size: CardValues.contentSize))
                .cardify(isFaceUp: card.isFaceUp)
                .onTapGesture {
                    game.choose(card)
                }
        }
    }
    
    var gameButtons: some View {
        HStack{
            Button("New Game"){
                game.newGame()
            }
            .font(Font.system(size: ViewConstants.newGameButtonSize))
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
