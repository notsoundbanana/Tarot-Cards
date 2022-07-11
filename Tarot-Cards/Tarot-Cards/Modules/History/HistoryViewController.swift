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
        
        self.navigationController!.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor(red: 0.2039, green: 0.2157, blue: 0.2667, alpha: 1)
        collectionView.backgroundColor = UIColor(red: 0.2039, green: 0.2157, blue: 0.2667, alpha: 1)
        
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
        
        cell.setupRecentCard(with: arrayOfRecentCards.reversed()[indexPath.row])
        
        cell.backgroundColor = UIColor(red: 0.2039, green: 0.2157, blue: 0.2667, alpha: 1)
        collectionView.backgroundColor = UIColor(red: 0.2039, green: 0.2157, blue: 0.2667, alpha: 1)
        
        return cell
    }
}

extension HistoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
}
