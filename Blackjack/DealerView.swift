//
//  DealerView.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 27/12/2022.
//

import SwiftUI

struct DealerView: View {
    @ObservedObject var viewModel: GameViewModel
    var body: some View {
        ZStack(alignment: .center){
            Image("cardback")
                .resizable()
                .frame(width: 100, height: 150)
                .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 2, y:2)

            Text("Test")
            
            PlayerView(player: viewModel.game.dealer )
                .padding(5)
        }
    }
}

struct DealerView_Previews: PreviewProvider {
    static var previews: some View {
        DealerView(viewModel: GameViewModel(game: Game(player: Player(), dealer: Player(), deck: Deck(numberOfDecks: 6))))
    }
}
