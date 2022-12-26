//
//  Card.swift
//  Blackjack
//
//  Created by Elisei Bobocea on 26/12/2022.
//

import SwiftUI

enum Suit: String, CaseIterable {
    case hearts, diamonds, clubs, spades
}

enum Rank: Int, CaseIterable {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    var setValue: Int {
        switch self {
        case .jack, .queen, .king:
            return 10
        default:
            return rawValue
        }
    }
    
    var blackjackValue: Int {
        switch self {
        case .ace:
            return 11
        default:
            return rawValue
        }
    }
}

struct Card: Hashable, Identifiable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank && lhs.suit == rhs.suit && lhs.image == rhs.image && lhs.id == rhs.id
    }
    
    var id = UUID()
    let image: Image
    let suit: Suit
    let rank: Rank
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(rank)
        hasher.combine(suit)
    }
    
    var hashValue: Int {
        var hasher = Hasher()
        hash(into: &hasher)
        return hasher.finalize()
    }
}

