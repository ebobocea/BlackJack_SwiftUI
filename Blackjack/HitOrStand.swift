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
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 2, y:2)
                    .padding(.leading, 5)
                
            })
            .opacity(viewModel.hitButtonVisible ? 1 : 0)
            Spacer()
            Button(action: {
                withAnimation{
                    viewModel.stand()
                }
            }, label: {
                Image("standButton")
                    .shadow(color: Color(red:0, green: 0, blue: 0, opacity: 0.5), radius: 4, x: 2, y:2)
                    .padding(.trailing, 5)
            })
            .opacity(viewModel.standButtonVisible ? 1 : 0)
        }
    }
}
