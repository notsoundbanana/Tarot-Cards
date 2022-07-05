//
//  TarotCard.swift
//  Tarot-Cards
//
//  Created by LudwigAndreas on 05.07.2022.
//

import Foundation

struct TarotCard {
    let type: CardType
    var typeString: String {
        return type.rawValue
    }
    let name: String
    let value: String
    let valueInt: Int
    let meaningUp, meaningRev, desc: String
    let suit: Suit?
    var suitString: String? {
        return suit?.rawValue
    }
    
    init?(card: Card) {
        type = card.type
        name = card.name
        value = card.value
        valueInt = card.valueInt
        meaningUp = card.meaningUp
        meaningRev = card.meaningRev
        desc = card.desc
        suit = card.suit
    }
}
