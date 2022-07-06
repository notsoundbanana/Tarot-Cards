//
//  SearchViewController.swift
//  Tarot-Cards
//
//  Created by LudwigAndreas on 04.07.2022.
//

import UIKit

class SearchViewController: UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var networkCardManager = NetworkCardManager()
    let searchController = UISearchController()
    var tarotCards = [TarotCard]()
    

    override func viewWillAppear(_ animated: Bool) {
        networkCardManager.onCompletion = { [unowned self]  recivedTarotCards in
            self.tarotCards = recivedTarotCards
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        networkCardManager.fetchAllCards()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension SearchViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarotCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchingTableViewCell", for: indexPath) as? SearchingTableViewCell else { return UITableViewCell() }
        
        let card = tarotCards[indexPath.row]
        cell.nameLabel?.text = card.name
        cell.cardImage?.image = UIImage(named: card.tarotCardIconNameString)
        cell.descLabel?.text = card.desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped \(indexPath.row)")
    }
}
