//
//  PlayerView.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var player: Player
    

    init(player: Player) {
        self.player = player
    }

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive (minimum: 100), spacing: -70)]) {
            ForEach(player.hand) { card in
                CardView(image: card.image)
                    .transition(.offset(x: 150, y: 0))
            }
        }
    }
}
