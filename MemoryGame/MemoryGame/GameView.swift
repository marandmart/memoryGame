//
//  ContentView.swift
//  MemoryGame
//
//  Created by Mário André Martins on 16/01/23.
//

import SwiftUI

struct GameView: View {
    
    typealias Card = GameModel<String>.Card
    
    @ObservedObject var game: GameVM
    @State private var dealt = Set<Int>()
    @Namespace private var dealingNamespace
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(spacing: 0){
                ZStack(alignment: .center){
                    title
                    HStack() {
                        if dealt.count != 0 {
                            Spacer()
                            restart
                        }
                    }
                }
                .padding(.horizontal)
                cardScroll
            }
            deckBody
        }
    }
    
    var title: some View {
        Text("Memory Game")
            .font(Font.system(size: ViewConstants.titleFontSize, weight: ViewConstants.titleFontWeight))
            .foregroundColor(ViewConstants.titleColor)
    }
    
    var restart: some View {
        Button("Restart"){
            withAnimation {
                dealt = []
                game.newGame()
            }
        }
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 60))
    ]
    
    private func deal(_ card: Card) {
        dealt.insert(card.id)
    }
    
    private func notDealt(_ card: Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    var cardScroll: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                ForEach(game.cards) { card in
                    cardView(for: card)
                }
            }
            .padding(.top, 30.0)
        }
        .padding(.horizontal)
    }
    
    private func cardIndex(for card: Card) -> Double {
        -Double(game.cards.firstIndex(where: {$0.id == card.id}) ?? 0)
    }
    
    @ViewBuilder
    private func cardView(for card: Card) -> some View {
        if notDealt(card) || (card.isMatched && !card.isFaceUp) {
            RoundedRectangle(cornerRadius: CardValues.cornerSize)
                .fill(Color.clear)
                .aspectRatio(CardValues.aspectRatio, contentMode: .fit)
        } else {
            Text(card.content)
                .cardify(isFaceUp: card.isFaceUp, isMatched: card.isMatched)
                .zIndex(cardIndex(for: card))
                .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                .onTapGesture {
                    withAnimation {
                        game.choose(card)
                    }
                }
        }
    }
    
    private func dealAnimation(for card: Card) -> Animation{
        var delayLength = 0.0
        if let index = game.cards.firstIndex(where: {$0.id == card.id}) {
            delayLength = Double(index) * CardValues.totalAnimationDuration / Double(game.cards.count)
        }
        return Animation.easeInOut(duration: CardValues.dealAnimationLength).delay(delayLength)
    }
    
    var deckBody: some View {
        ZStack {
            if dealt.count == 0 {
                Text("Start").foregroundColor(.white).zIndex(50).transition(AnyTransition.identity)
            }
            ForEach(game.cards.filter(notDealt)) { card in
                Text(card.content)
                    .cardify(isFaceUp: false, isMatched: false)
                    .zIndex(cardIndex(for: card))
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
            }
        }
        .onTapGesture {
            for card in game.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
        .frame(width: CardValues.deckWidth, height: CardValues.deckHeight, alignment: .bottom)
        .foregroundColor(CardValues.backsideColor)
    }
    
    
    private struct CardValues {
        static let cornerSize: CGFloat = 8
        static let backsideColor: Color = .red
        static let aspectRatio: CGFloat = 2/3
        static let contentSize: CGFloat = 50
        static let cardLinewidth: CGFloat = 5
        static let dealAnimationLength: Double = 1
        static let totalAnimationDuration: Double = 3
        
        // pie
        static let pieColor: Color = .red
        static let pieColorOpacity: Double = 0.8
        static let pieScalingFactor: Double = 0.75
        
        // deck
        static let deckWidth: CGFloat = 60
        static let deckHeight: CGFloat = 90
    }
    
    private struct ViewConstants {
        static let newGameButtonSize: CGFloat = 20
        static let titleColor: Color = .blue
        static let titleFontSize: CGFloat = 24
        static let titleFontWeight: Font.Weight = .bold
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static let game = GameVM()
    static var previews: some View {
        GameView(game: game)
    }
}
