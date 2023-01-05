//
//  Game.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import Foundation

class Game{
    var player: Player
    var dealer: Player
    var deck: Deck
    
    init(player: Player, dealer: Player, deck: Deck) {
        self.player = player
        self.dealer = dealer
        self.deck = deck
    }
    
    func startNewGame() {
        if !player.hand.isEmpty && !dealer.hand.isEmpty{
            player.hand.removeAll()
            dealer.hand.removeAll()
        }
        
        deck.shuffle()
        
        player.receiveCard(card: deck.deal()!)
        player.receiveCard(card: deck.deal()!)
        
        dealer.receiveCard(card: deck.deal()!)
        dealer.receiveCard(card: deck.deal()!)
        
    }
    
    func hit(player: Player) {
        // deal a card to the specified hand
        player.receiveCard(card: deck.deal()!)
    }
    
    func stand() {
        // while the dealer's hand is below 17, have the dealer hit
        while dealer.calculateScore() < 17 {
            hit(player: dealer)
        }
    }
    
    func determineWinner() -> String {
        if player.isBust() {
            if dealer.isBust() {
                return "Both Bust"
            } else {
                return "Player Bust"
            }
        } else if dealer.isBust() {
            return "Dealer bust"
        } else {
            if player.calculateScore() > dealer.calculateScore() {
                return "Player Win"
            } else if dealer.calculateScore() > player.calculateScore() {
                return "Dealer Win"
            } else {
                return "Tie"
            }
        }
    }
}
