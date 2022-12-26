//
//  BlackjackApp.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import SwiftUI

@main
struct BlackjackApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: GameViewModel(game: Game(player: Player(), dealer: Player(), deck: Deck(numberOfDecks: 6))))
        }
    }
}
