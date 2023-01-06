//
//  Wallet.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 05/01/2023.
//

import Foundation

class Wallet: ObservableObject {
    @Published var balance: Int
    @Published var bet: Int
    @Published var inssufiicientFunds = false
    
    init(balance: Int, bet: Int = 0, inssufiicientFunds: Bool = false) {
        self.balance = balance
        self.bet = bet
        self.inssufiicientFunds = inssufiicientFunds
    }
    
    func placeBet(amount: Int){
        if balance >= amount{
            balance -= amount
            bet = amount
        } else {
            inssufiicientFunds.toggle()
        }
    }
}
