//
//  Wallet.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 05/01/2023.
//

import Foundation

class Wallet: ObservableObject {
    @Published var balance: Double
    @Published var bet: Double
    @Published var insufficientFunds = false
    
    init(balance: Double, bet: Double = 0, insufficientFunds: Bool = false) {
        self.balance = balance
        self.bet = bet
        self.insufficientFunds = insufficientFunds
    }
    
    func placeBet(amount: Double){
        if balance >= amount{
            balance -= amount
            bet = amount
            insufficientFunds = false
        } else {
            insufficientFunds = true
        }
    }
    func checkForBalance(){
        if balance >= bet{
            insufficientFunds = false
        } else {
            insufficientFunds = true
        }
    }
}
