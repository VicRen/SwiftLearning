//
//  MemoryGame.swift
//  SwiftLearning
//
//  Created by Vic Ren on 2020/5/25.
//  Copyright © 2020 Vic Ren. All rights reserved.
//

import Foundation

struct MemoryGame<CardConent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardConentFactory: (Int) -> CardConent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardConentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUP: Bool = true
        var isMatched: Bool = false
        var content: CardConent
        var id: Int
    }
}
