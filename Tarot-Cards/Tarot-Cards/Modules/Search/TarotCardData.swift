//
//  TarotCardData.swift
//  Tarot-Cards
//
//  Created by LudwigAndreas on 04.07.2022.
//

import Foundation

struct TarotCardsData: Codable{
    let cards: [Card]
}

struct Card: Codable {
    let type: CardType
    let name: String
    let nameShort: String
    let value: String
    let valueInt: Int
    let meaningUp, meaningRev, desc: String
    let suit: Suit?
    
    enum CodingKeys: String, CodingKey {
        case type
        case nameShort = "name_short"
        case name, value
        case valueInt = "value_int"
        case meaningUp = "meaning_up"
        case meaningRev = "meaning_rev"
        case desc, suit
    }
}

enum Suit: String, Codable {
    case cups = "cups"
    case pentacles = "pentacles"
    case swords = "swords"
    case wands = "wands"
}

enum CardType: String, Codable {
    case major = "major"
    case minor = "minor"
}
