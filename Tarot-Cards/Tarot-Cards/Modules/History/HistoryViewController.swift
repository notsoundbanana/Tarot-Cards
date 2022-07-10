//
//  HistoryViewController.swift
//  Tarot-Cards
//
//  Created by Artyom Mitrofanov on 10.07.2022.
//

import UIKit

var arrayOfRecentCards: [TarotCard] = []

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let dataStore = DataStoreManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        dataStore.prepareForWork()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
}

extension HistoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfRecentCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryViewCell", for: indexPath) as! HistoryViewCell
        
        cell.setupRecentCard(with: arrayOfRecentCards[indexPath.row])
        return cell
    }
}

extension HistoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 500, height: 200)
    }
}
