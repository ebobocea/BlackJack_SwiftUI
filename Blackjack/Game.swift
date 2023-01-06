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
    var wallet: Wallet
    
    init(player: Player, dealer: Player, deck: Deck, wallet: Wallet) {
        self.player = player
        self.dealer = dealer
        self.deck = deck
        self.wallet = wallet
    }
    
    func startNewGame() {
        wallet.placeBet(amount: wallet.bet)
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
                wallet.bet = 0
                return "Both Bust"
            } else {
                return "Player Bust"
            }
        } else if dealer.isBust() {
            wallet.balance += (wallet.bet * 2)
            wallet.bet = 0
            return "Dealer bust"
        } else {
            if player.calculateScore() > dealer.calculateScore() {
                wallet.balance += (wallet.bet * 2)
                wallet.bet = 0
                return "Player Win"
            } else if dealer.calculateScore() > player.calculateScore() {
                wallet.bet = 0
                return "Dealer Win"
            } else {
                wallet.balance += wallet.bet
                wallet.bet = 0
                return "Tie"
            }
        }
        
    }
}
