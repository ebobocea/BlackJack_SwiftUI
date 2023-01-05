//
//  HitOrStand.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 05/01/2023.
//

import SwiftUI

struct HitOrStand: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        HStack{
            Button(action: {
                withAnimation{
                    viewModel.hit()
                }
            }, label: {
                Image("hitButton")
                    .resizable()
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 2, y:2)
                    .scaledToFit()
                    .padding(.leading, 5)
                
            })
            .opacity(viewModel.hitButtonVisible ? 1 : 0)
            
            Button(action: {
                viewModel.resetGame()
                
            }, label: {
                Image("newButton")
                    .resizable()
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 2, y:2)
                    .scaledToFit()
            })
            .opacity(viewModel.newGameButtonVisible ? 1 : 0)
            
            Button(action: {
                withAnimation{
                    viewModel.stand()
                }
            }, label: {
                Image("standButton")
                    .resizable()
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 2, y:2)
                    .scaledToFit()
                    .padding(.trailing, 5)
            })
            .opacity(viewModel.standButtonVisible ? 1 : 0)
        }
    }
}

struct HitOrStand_Previews: PreviewProvider {
    static var previews: some View {
        HitOrStand()
            .environmentObject(GameViewModel(game: Game(player: Player(), dealer: Player(), deck: Deck(numberOfDecks: 6))))
    }
}
