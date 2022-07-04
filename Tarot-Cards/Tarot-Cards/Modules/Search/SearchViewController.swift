//
//  SearchViewController.swift
//  Tarot-Cards
//
//  Created by LudwigAndreas on 04.07.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cardDescription: UITableView!
    @IBOutlet weak var cardName: UITableView!
    @IBOutlet weak var cardImage: UITableView!
    @IBOutlet var tableView : UITableView!
    
    let networkCardManager = NetworkCardManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchBar.placeholder = "The Magician"
//        if searchBar.text != nil {
//            print(searchBar.text!)
//        }
        networkCardManager.fetchAllCards()
//        networkCardManager.fetchRandomCards(numOfCards: 1)
    }

    
}


extension SearchViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped \(indexPath.row)")
    }
}

extension SearchViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        
//        cell.textLabel?.text = "Hello world"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
