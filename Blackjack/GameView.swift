//
//  ContentView.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    @State private var betAmount: String = ""
    
    var body: some View {
        
        ZStack {
            Image("newbackground")
                .resizable()
                .ignoresSafeArea()
            VStack {
                ZStack{
                    PlayerView(player: viewModel.game.dealer )
                        .padding(5)
                    CardBackView()
                        .opacity(viewModel.standButtonVisible ? 1 : 0)
                        .padding(.trailing, 252)
                    
                }
                
                Text("Dealer Hand: \(viewModel.dealerHandTotal)")
                    .foregroundColor(.white)
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 0, y:4)
                
                Text(viewModel.winner)
                    .foregroundColor(.white)
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 0, y:4)
                
                Spacer()
                
                Text("Player Hand: \(viewModel.playerHandTotal)")
                    .foregroundColor(.white)
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 0, y:4)
                
                Text("Player balance: $\(viewModel.game.player.balance)")
                    .foregroundColor(.white)
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 0, y:4)
                
                Text("Current bet: $\(betAmount)")
                    .foregroundColor(.white)
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 0, y:4)
                
                PlayerView(player: viewModel.game.player )
                    .padding(5)
                
                
                
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
                HStack {
                    TextField("Enter bet amount", text: $betAmount)
                        .keyboardType(.numberPad)
                    Button(action: {
                        if let amount = Int(self.betAmount) {
                            self.viewModel.game.placeBet(amount: amount)
                        }
                    }, label: {
                        Text("Place bet")
                    })
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(game: Game(player: Player(balance: 100), dealer: Player(balance: 0), deck: Deck(numberOfDecks: 6))))
    }
}
