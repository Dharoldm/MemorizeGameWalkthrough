//
//  ContentView.swift
//  Memorize
//
//  Created by Danny on 8/28/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game : EmojiMemoryGame
    
    
    var body : some View{
        

        VStack{
            ScrollView{
                LazyVGrid(columns : [GridItem(.adaptive(minimum:75))]){
                    ForEach(game.cards){ card in
                        CardView(card)
                            .aspectRatio(2/3,contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                    
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        }
            
        }
    }

struct CardView : View{

    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card){
        self.card = card
    }
    
    var body : some View
    {
        GeometryReader(content: { geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp{
                    shape.fill(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth).foregroundColor(.red)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched{
                    shape.opacity(0)
                }
                else
                {
                    shape.fill(.red)
                }
            }
        })
        
    }
    
    private func font(in size: CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
