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
    @Published var hitButtonVisible: Bool = false
    @Published var standButtonVisible: Bool = false
    @Published var newGameButtonVisible: Bool = true
    
    init(game: Game) {
        self.game = game
        self.winner = ""
    }
    
    func checkForBlackJack(){
        if game.player.hasBlackjack(){
            stand()
            
        } else if game.dealer.hasBlackjack(){
            stand()
        }
    }
    
    func resetGame(){
        winner = ""
        game.startNewGame()
        playerHandTotal = game.player.calculateScore()
        dealerHandTotal = game.dealer.hand[0].rank.setValue
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
