//
//  SearchViewController.swift
//  Tarot-Cards
//
//  Created by LudwigAndreas on 04.07.2022.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cardDescription: UITableView!
    @IBOutlet weak var cardName: UITableView!
    @IBOutlet weak var cardImage: UITableView!
    @IBOutlet var tableView : UITableView!
    
    var networkCardManager = NetworkCardManager()
    let searchController = UISearchController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        networkCardManager.onCompletion = { tarotCards in
            print(tarotCards[0].desc)
        }
        networkCardManager.fetchAllCards()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
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
