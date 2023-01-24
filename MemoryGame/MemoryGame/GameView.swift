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
                    if !card.isMatched {
                        Card(content: card.content, showContent: card.isFaceUp)
                            .onTapGesture {
                                game.choose(card)
                            }
                    } else {
                        Card(content: card.content, showContent: true)
                    }
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
    
    struct Card: View {
        let content: String
        var showContent: Bool
        
        var body: some View {
            let shape: RoundedRectangle = RoundedRectangle(cornerRadius: CardValues.cornerSize)
            ZStack{
                if showContent {
                    shape
                        .strokeBorder(CardValues.backsideColor, lineWidth: CardValues.cardLinewidth)
                        .aspectRatio(CardValues.aspectRatio, contentMode: .fit)
                    
                } else {
                    shape
                        .fill(CardValues.backsideColor)
                        .aspectRatio(CardValues.aspectRatio, contentMode: .fit)
                }
                Text(content)
                    .font(Font.system(size: CardValues.contentSize))
                    .opacity(showContent ? 1 : 0)
            }
        }
    }
    
    var gameButtons: some View {
        HStack{
            Button("New Game"){
                game.newGame()
            }.font(Font.system(size: ViewConstants.newGameButtonSize))
        }
    }
    
    
    private struct CardValues {
        static let cornerSize: CGFloat = 8
        static let backsideColor: Color = .red
        static let aspectRatio: CGFloat = 2/3
        static let contentSize: CGFloat = 50
        static let cardLinewidth: CGFloat = 5
    }
    
    private struct ViewConstants {
        static let newGameButtonSize: CGFloat = 20
        static let titleColor: Color = .blue
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static let game = GameVM()
    static var previews: some View {
        GameView(game: game)
    }
}
