//
//  GameViewModel.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var playerHandTotal: Int = 0
    @Published var dealerHandTotal: Int = 0
    @Published var winner: String
    @Published var game: Game
    @Published var hitButtonVisible: Bool = true
    @Published var standButtonVisible: Bool = true
    @Published var newGameButtonVisible: Bool = false
    
    init(game: Game) {
        self.game = game
        self.winner = ""
        game.startNewGame()
        playerHandTotal = game.player.calculateScore()
        dealerHandTotal = game.dealer.calculateScore()
        checkForBlackJack()
        
    }
    
    func checkForBlackJack(){
        if game.player.hasBlackjack(){
            stand()
            winner = "Player Has BlackJack"
            
        } else if game.dealer.hasBlackjack(){
            stand()
            winner = "Dealer Has BlackJack"
        }
    }
    
    func resetGame(){
        winner = ""
        game.startNewGame()
        playerHandTotal = game.player.calculateScore()
        dealerHandTotal = game.dealer.calculateScore()
        hitButtonVisible = true
        standButtonVisible = true
        newGameButtonVisible = false
        checkForBlackJack()
    }
    
    func hit() {
        game.hit(player: game.player)
        playerHandTotal = game.player.calculateScore()
        if game.player.isBust(){
            stand()
        }
    }
    
    func stand() {
        game.stand()
        dealerHandTotal = game.dealer.calculateScore()
        winner = game.determineWinner()
        hitButtonVisible = false
        standButtonVisible = false
        newGameButtonVisible = true
    }
}
