//
//  ChipsView.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 05/01/2023.
//

import SwiftUI

struct ChipsView: View {
    
    @State private var valueChip = 0
    @State private var nameChip = ""
    var body: some View {
        VStack{
            HStack{
                ForEach(Chip.allCases, id:\.rawValue) { chip in
                    ChipView(
                        image: Image("\(chip)"),
                        valueOfChip: Text("\(chip.rawValue)")
                            .foregroundColor(chip.rawValue == 200 ? .black : .white)
                    )
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .onTapGesture {
                        nameChip = "\(chip)"
                        valueChip = chip.rawValue
                    }
                }
                
            }
            Text("\(nameChip)")
            Text("\(valueChip)")
        }
    }
}

struct ChipsView_Previews: PreviewProvider {
    static var previews: some View {
        ChipsView()
    }
}
