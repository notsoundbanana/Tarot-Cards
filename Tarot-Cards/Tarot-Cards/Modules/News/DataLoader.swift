//
//  DataLoader.swift
//  Tarot-Cards
//
//  Created by Полина Рыфтина on 10.07.2022.
//

import Foundation

public class DataLoader {
    
    var newsData = [NewsData]()
    
    init() {
        load()
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "news", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([NewsData].self, from: data)
                
                self.newsData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}
