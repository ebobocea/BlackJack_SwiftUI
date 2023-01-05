//
//  Chips.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 05/01/2023.
//

import SwiftUI

struct Chips{
    private var chips = [
        "RedChip":10,
        "GreenChip":20,
        "BlueChip":50,
        "BlackChip":100,
        "WhiteChip":200,
    ]
    var chipsView: [ChipView]
    
    init() {
        self.chipsView = []
        for chip in chips{
            chipsView.append(ChipView(image: Image(chip.key), valueOfChip: Text(String(chip.value))))
        }        }
    }
