//
//  EmojiMemoryGame.swift
//  SwiftLearning
//
//  Created by Vic Ren on 2020/5/25.
//  Copyright © 2020 Vic Ren. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojiArray = ["🐶", "🐷", "🕷️"]
        return MemoryGame<String>(numberOfPairsOfCards: 3) {index in
            return emojiArray[index]
        }
    }
    
    // MARK: -Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: -Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        game.choose(card: card)
    }
    
    func testing() {
    }
}
