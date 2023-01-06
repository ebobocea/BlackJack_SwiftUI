//
//  Player.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import SwiftUI

class Player: ObservableObject {
    @Published var hand: [Card]

    var score: Int {
        return calculateScore()
    }

        
    init() {
        self.hand = []
    }
    
    func receiveCard(card: Card) {
        self.hand.append(card)
    }
    
    func hasBlackjack() -> Bool{
        if hand[0].rank == .ace || hand[1].rank == .ace{
            if hand.count == 2 && calculateScore() == 21{
                return true
            }
        }
        return false
    }
    
    func calculateScore() -> Int{
        var numAces = 0
        var score = 0
        for card in hand {
            if card.rank == .ace {
                numAces += 1
            } else {
                score += card.rank.setValue
            }
        }
        for _ in 0..<numAces {
            if score + 11 > 21 {
                score += 1
            } else {
                score += 11
            }
        }
        return score
    }
    
    func isBust() -> Bool{
        return calculateScore() > 21
    }
}
