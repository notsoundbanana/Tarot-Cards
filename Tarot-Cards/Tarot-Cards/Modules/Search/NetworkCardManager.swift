//
//  NetworkCardManager.swift
//  Tarot-Cards
//
//  Created by LudwigAndreas on 04.07.2022.
//

import Foundation

struct NetworkCardManager {
    
    var onCompletion: (([TarotCard]) -> Void)?
    
    func fetchAllCards(){
        let urlString = "https://rws-cards-api.herokuapp.com/api/v1/cards/"
        guard let url = URL(string: urlString) else { return }
        //Если нет ответа, вывести Alert
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let tarotCards = self.parseJSON(withData: data) {
                    self.onCompletion?(tarotCards)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> [TarotCard]?{
        let decoder = JSONDecoder()
        do {
            let tarotCardsData = try decoder.decode(TarotCardsData.self, from: data)
            var tarotCards: [TarotCard] = []
            for card in tarotCardsData.cards {
                guard let toAppendCard = TarotCard(card: card) else { continue }
                tarotCards.append(toAppendCard)
            }
            return tarotCards
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
