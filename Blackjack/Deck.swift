//
//  Deck.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import SwiftUI

class Deck {
    private var cards: [Card]
    
    init(numberOfDecks: Int = 1) {
        self.cards = []
        for _ in 1...numberOfDecks {
            for suit in Suit.allCases {
                for rank in Rank.allCases {
                    cards.append(Card(image: Image("\(rank)_\(suit)"), suit: suit, rank: rank))
                }
            }
        }
    }
    
    func shuffle() {
        self.cards.shuffle()
    }
    
    func deal() -> Card? {
        if self.cards.isEmpty {
            self.cards = Deck(numberOfDecks: 6).cards
        }
        return self.cards.remove(at: 0)
    }
    
    func remainingCards() -> Int {
        return self.cards.count
    }
}
