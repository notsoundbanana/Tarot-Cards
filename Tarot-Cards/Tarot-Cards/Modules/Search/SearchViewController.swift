//
//  SearchViewController.swift
//  Tarot-Cards
//
//  Created by LudwigAndreas on 04.07.2022.
//

import UIKit

class SearchViewController: UIViewController{
      
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var networkCardManager = NetworkCardManager()
    var tarotCards = [TarotCard]()
    var filtredTarotCards: [TarotCard]!
    

    override func viewWillAppear(_ animated: Bool) {
        networkCardManager.onCompletion = { [unowned self]  recivedTarotCards in
            self.tarotCards = recivedTarotCards
            self.filtredTarotCards = tarotCards
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        networkCardManager.fetchAllCards()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        filtredTarotCards = tarotCards
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.searchTextField.backgroundColor = .white
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filtredTarotCards = tarotCards
        } else {
            filtredTarotCards = []
            for card in tarotCards {
                if card.name.lowercased().contains(searchText.lowercased()) {
                    filtredTarotCards.append(card)
                }
            }
        }
        self.collectionView.reloadData()
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filtredTarotCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardSearchCollectionViewCell", for: indexPath) as! CardSearchCollectionViewCell
        cell.setup(with: filtredTarotCards[indexPath.row])
        return cell
    }
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(filtredTarotCards[indexPath.row].name)
    }
}
