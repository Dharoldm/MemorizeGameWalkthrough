//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Danny on 12/10/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card

    private static let emojis = ["🚙", "🚚", "✈️", "🎢", "🚜", "🦼", "🚢","⛴️","🚄","🚃","🚁","🚇","🚝","🚀","🛳️","🛩️","🚞","🚔","🏎️","🦼"]
    
    private static func CreateMemoryGame() -> MemoryGame<String>{
        
        MemoryGame<String>(numberofPairsofCarfds: 8) {pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    @Published private var model = CreateMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK:  -  Intent(s)
    func choose(_ card: Card){
        model.choose(card)
    }
}
