//
//  ContentView.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        
        ZStack {
            Image("newbackground")
                .resizable()
                .ignoresSafeArea()
            VStack {
                ZStack(alignment: .leading){
                    PlayerView(player: viewModel.game.dealer )
                        .padding(5)
                    CardBackView()
                        .opacity(viewModel.standButtonVisible ? 1 : 0)
                        .offset(x: 37)
                }
                 
                Text("Dealer Hand: \(viewModel.dealerHandTotal)")
                    .foregroundColor(.white)
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 0, y:4)
                
                Spacer()
                
                Text(viewModel.winner)
                    .foregroundColor(.white)
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 0, y:4)
                
                Spacer()
                Text("Player Hand: \(viewModel.playerHandTotal)")
                    .foregroundColor(.white)
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 0, y:4)
                HStack{
                    
                    Text(String(format: "$%.1f",viewModel.game.wallet.balance))
                        .foregroundColor(.white)
                        .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 0, y:4)
                    Spacer()
                    Text(String(format: "$%.1f", viewModel.game.wallet.bet))
                        .foregroundColor(.white)
                        .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 0, y:4)
                }
                .padding()
                PlayerView(player: viewModel.game.player)  
                    .padding(5)
                
                HitOrStand() 
                ChipsView()
                    .padding(.top)
                    .opacity(viewModel.standButtonVisible ? 0.5 : 1)
                    .disabled(viewModel.standButtonVisible)

            }  
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameViewModel(game: Game(player: Player(), dealer: Player(), deck: Deck(numberOfDecks: 6))))
    }
}

