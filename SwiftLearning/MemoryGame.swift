//
//  MemoryGame.swift
//  SwiftLearning
//
//  Created by Vic Ren on 2025/1/13.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score = 0
    
    init(numberOfPairesOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<max(2, numberOfPairesOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
        }
    }
    
    func choose(_ cards: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomStringConvertible {
        var isFaceUp = false
        let content: CardContent
        var id: String
        
        var description: String {
            "\(id):\(content) \(isFaceUp ? "up" : "down")"
        }
    }
}
