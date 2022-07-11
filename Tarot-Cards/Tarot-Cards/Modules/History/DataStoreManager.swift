//
//  DataStoreManager.swift
//  Tarot-Cards
//
//  Created by Artyom Mitrofanov on 10.07.2022.
//

import Foundation

class DataStoreManager {
    
    func prepareForWork() {
        if let data = UserDefaults.standard.object(forKey: "arrayOfOpenedCards") as? Data { arrayOfRecentCards = try! PropertyListDecoder().decode(Array<TarotCard>.self, from: data)
        }
    }
    
    func saveCard(_ card: TarotCard) {
        if arrayOfRecentCards.count >= 10 {
            arrayOfRecentCards.removeFirst()
            arrayOfRecentCards.append(card)
        } else {
            arrayOfRecentCards.append(card)
        }
        UserDefaults.standard.set(try? PropertyListEncoder().encode(arrayOfRecentCards), forKey: "arrayOfOpenedCards")
    }
    
}
