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
                    Card(content: card.content)
                }
            }
        }
        .padding()
    }
    
    var title: some View {
        Text("Memory Game")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.blue)
            .foregroundColor(Color.blue)
            .padding(.top)
    }
    
    struct Card: View {
        let content: String
        let showContent: Bool = true
        
        var body: some View {
            let shape: RoundedRectangle = RoundedRectangle(cornerRadius: CardValues.cornerSize)
            ZStack{
                if showContent {
                    shape
                        .strokeBorder(CardValues.backsideColor, lineWidth: 5)
                        .aspectRatio(CardValues.aspectRatio, contentMode: .fit)
                    Text(content)
                        .font(Font.system(size: CardValues.contentSize))
                } else {
                    shape
                        .fill(CardValues.backsideColor)
                        .aspectRatio(CardValues.aspectRatio, contentMode: .fit)
                }
            }
        }
    }
    
    var gameButtons: some View {
        HStack{
            Button {
                print("new game button tapped")
            } label: {
                Text("New Game")
                    .fontWeight(.bold)
            }
            Spacer()
            Button {
                print("reset button tapped")
            } label: {
                Text("Reset")
                    .fontWeight(.bold)
            }
        }
        .padding(.horizontal)
    }
    
    
    
    
    private struct CardValues {
        static let cornerSize: CGFloat = 8
        static let backsideColor: Color = .red
        static let aspectRatio: CGFloat = 2/3
        static let contentSize: CGFloat = 50
    }
    
}










struct ContentView_Previews: PreviewProvider {
    static let game = GameVM()
    static var previews: some View {
        GameView(game: game)
    }
}
