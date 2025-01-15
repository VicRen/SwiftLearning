//
//  EmojiMemoryGame.swift
//  SwiftLearning
//
//  Created by Vic Ren on 2025/1/13.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis: Array<String> = ["👻", "🎃", "🦇","🧛","⚰️","🪄","🔮","🧿","🦄","🍭","🧙","🧌"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairesOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                emojis[pairIndex]
            } else {
                "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
