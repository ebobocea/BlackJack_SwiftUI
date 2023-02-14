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
    var wallet = Wallet(balance: 100)
    
    init(player: Player, dealer: Player, deck: Deck) {
        self.player = player
        self.dealer = dealer
        self.deck = deck
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
        player.receiveCard(card: deck.deal()!)
    }
    
    func stand() {
        while dealer.calculateScore() < 17 {
            hit(player: dealer)
        }
    }
    
    func determineWinner() -> String {
        if player.hasBlackjack() {
            wallet.balance += (wallet.bet * 2.5)  // pay out 3:2 odds for a blackjack
            wallet.checkForBalance()
            wallet.bet = 0
            return "Player has blackjack"
        } else if dealer.hasBlackjack() {
            wallet.checkForBalance()
            wallet.bet = 0
            return "Dealer has blackjack"
        } else if player.isBust() {
            if dealer.isBust() {
                wallet.checkForBalance()
                wallet.bet = 0
                return "Both Bust"
            } else {
                wallet.checkForBalance()
                wallet.bet = 0
                return "Player Bust"
            }
        } else if dealer.isBust() {
            wallet.balance += (wallet.bet * 2)
            wallet.checkForBalance()
            wallet.bet = 0
            return "Dealer bust"
        } else {
            if player.calculateScore() > dealer.calculateScore() {
                wallet.balance += (wallet.bet * 2)
                wallet.checkForBalance()
                wallet.bet = 0
                return "Player Win"
            } else if dealer.calculateScore() > player.calculateScore() {
                wallet.checkForBalance()
                wallet.bet = 0
                return "Dealer Win"
            } else {
                wallet.balance += wallet.bet
                wallet.checkForBalance()
                wallet.bet = 0
                return "Tie"
            }
        }
    }
}
