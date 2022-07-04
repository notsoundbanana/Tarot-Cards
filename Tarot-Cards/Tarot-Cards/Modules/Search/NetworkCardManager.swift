//
//  NetworkCardManager.swift
//  Tarot-Cards
//
//  Created by LudwigAndreas on 04.07.2022.
//

import Foundation

struct NetworkCardManager {
    
    func fetchCard(url urlString: String){
        guard let url = URL(string: urlString) else { return }
        //Если нет ответа, вывести Alert
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
//                print(data)
                self.parseJSON(withData: data)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) {
        let decoder = JSONDecoder()
        do {
            
            let tarotCardsData = try decoder.decode(TarotCardsData.self, from: data)
            print(tarotCardsData.cards[1].name)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func fetchAllCards(){
        let urlString = "https://rws-cards-api.herokuapp.com/api/v1/cards/"
        fetchCard(url: urlString)
    }
    
    func fetchRandomCards(numOfCards num: Int){
        let urlString = "https://rws-cards-api.herokuapp.com/api/v1/cards/random?n=\(num)"
        fetchCard(url: urlString)
    }
}
