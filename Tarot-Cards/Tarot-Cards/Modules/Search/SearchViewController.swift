//
//  SearchViewController.swift
//  Tarot-Cards
//
//  Created by LudwigAndreas on 04.07.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var networkCardManager = NetworkCardManager()   //API Network Manager
    var tarotCards = [TarotCard]()                  //after fetching all the data transformed into TarotCard array
    var filtredTarotCards: [TarotCard]!             //copy of tarotCards array for searching
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)      //Hiding navigation bar wile scrolling
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fetching data from API using async
        networkCardManager.onCompletion = { [unowned self]  recivedTarotCards in
            self.tarotCards = recivedTarotCards
            self.filtredTarotCards = tarotCards
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        networkCardManager.fetchAllCards()
        searchBar.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.searchTextField.backgroundColor = .white
        filtredTarotCards = tarotCards
        
        dataManager.prepareForWork()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated) // Show Navigation bar in CardView
    }
}

extension SearchViewController: UISearchBarDelegate {
    // Searching algorythm
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
    // Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filtredTarotCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardSearchCollectionViewCell", for: indexPath) as! CardSearchCollectionViewCell
        cell.setup(with: filtredTarotCards[indexPath.row]) //passing card to setup (just cleaning code)
        return cell
    }
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    // Collection View Cell parameters
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}

private let dataManager = DataStoreManager()

extension SearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "CardView", bundle: nil)
        
        guard let cardVC = storyboard.instantiateViewController(withIdentifier: "CardViewController") as? CardViewController else { return }
        
        cardVC.tarotCard.append(filtredTarotCards[indexPath.row]) // Passing selected card
        dataManager.saveCard(filtredTarotCards[indexPath.row])
        
        
        cardVC.modalPresentationStyle = .fullScreen
        present(cardVC, animated: true, completion: nil)
    }
}
