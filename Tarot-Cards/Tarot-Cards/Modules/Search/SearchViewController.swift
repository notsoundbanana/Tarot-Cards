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
    

    override func viewWillAppear(_ animated: Bool) {
        networkCardManager.onCompletion = { [unowned self]  recivedTarotCards in
            self.tarotCards = recivedTarotCards
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        networkCardManager.fetchAllCards()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.searchTextField.backgroundColor = .white
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = .red
//        searchBar.standardAppearance = appearance;
//        searchBar.scrollEdgeAppearance = navigationBar.standardAppearance
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tarotCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardSearchCollectionViewCell", for: indexPath) as! CardSearchCollectionViewCell
        cell.setup(with: tarotCards[indexPath.row])
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
        print(tarotCards[indexPath.row].name)
    }
}
