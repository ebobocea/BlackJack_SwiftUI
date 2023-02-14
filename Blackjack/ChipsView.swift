//
//  ChipsView.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 05/01/2023.
//

import SwiftUI

struct ChipsView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        HStack{
            ForEach(Chip.allCases, id:\.rawValue) { chip in
                ChipView(
                    image: Image("\(chip)"),
                    valueOfChip: Text(String(format: "%.1f", chip.rawValue))
                        .foregroundColor(chip.rawValue == 200 ? .black : .white)
                )
                .frame(minWidth: 0, maxWidth: .infinity)
                .opacity(Int(chip.rawValue) <= Int(viewModel.game.wallet.balance) ? 1 : 0.5 )
                .onTapGesture { 
                    viewModel.game.wallet.bet = chip.rawValue
                    
                    if Int(chip.rawValue) <= Int(viewModel.game.wallet.balance) {
                        viewModel.resetGame()
                    } 
                }
            }
        }
    }
}

struct ChipsView_Previews: PreviewProvider {
    static var previews: some View {
        ChipsView()
        
    }
}
