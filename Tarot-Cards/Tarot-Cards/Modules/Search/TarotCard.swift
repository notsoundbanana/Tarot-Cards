//
//  TarotCard.swift
//  Tarot-Cards
//
//  Created by LudwigAndreas on 05.07.2022.
//

import Foundation
import UIKit

struct TarotCard: Codable {
    let type: CardType
    var typeString: String {
        return type.rawValue
    }
    let name: String
    let shortName: String
    let value: String
    let valueInt: Int
    let meaningUp, meaningRev, desc: String
    let suit: Suit?
    var suitString: String? {
        return suit?.rawValue
    }
    
//TODO: var tarotCardIconNameString depends on valueInt
    var tarotCardIconNameString: String {
        return name
    }
    
    var tarrotCardIcon: UIImage! {
        return UIImage(named: tarotCardIconNameString)
    }
    
    init?(card: Card) {
        type = card.type
        name = card.name
        shortName = card.nameShort
        value = card.value
        valueInt = card.valueInt
        meaningUp = card.meaningUp
        meaningRev = card.meaningRev
        desc = card.desc
        suit = card.suit
    }

}
