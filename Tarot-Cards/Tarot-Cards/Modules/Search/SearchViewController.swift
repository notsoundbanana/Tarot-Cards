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
    
    var cardLabel = String()    //???
        
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

extension SearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(filtredTarotCards[indexPath.row].shortName)
        
        cardLabel = filtredTarotCards[indexPath.row].name
        let cardVC = CardViewController()
        cardVC.cardName = filtredTarotCards[indexPath.row].name  // Saving name of selected card
        performSegue(withIdentifier: "goToCardStoryboard", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cardVC = segue.destination as! CardViewController
        cardVC.cardName = cardLabel  // Passing card name through segue
    }
}
