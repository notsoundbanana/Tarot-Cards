//
//  NewsViewController.swift
//  Tarot-Cards
//
//  Created by Полина Рыфтина on 05.07.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: - Properties
    
    let newsArray = DataLoader().newsData
    let idCell = "newsCell"
    let idItem = "newsItem"
    
    // MARK: - UI
    
    @IBOutlet weak var newsTable: UITableView!
    @IBOutlet weak var newsCollection: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
   
    // MARK: - View file cycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.isHidden = true
       
        newsTable.dataSource = self
        newsTable.delegate = self
        newsCollection.dataSource = self
        newsCollection.delegate = self
        newsTable.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
        newsCollection.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: idItem)
        
        //making table & collection view  look
        newsTable.separatorStyle = .none
        newsTable.showsVerticalScrollIndicator = false
        newsTable.backgroundColor = UIColor(red: 0.2039, green: 0.2157, blue: 0.2667, alpha: 1)
        newsCollection.backgroundColor = UIColor(red: 0.2039, green: 0.2157, blue: 0.2667, alpha: 1)
        newsCollection.showsHorizontalScrollIndicator = false
        
        newsLabel.text = "Hot news"
        newsLabel.font = UIFont(name: "MyriadPro-Regular", size: 22)
        newsLabel.backgroundColor = UIColor(red: 0.2039, green: 0.2157, blue: 0.2667, alpha: 1)
    }
}

// MARK: - Table view data source, delegate

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? NewsTableViewCell else { return UITableViewCell() }
        cell.cellLabel.text = newsArray[indexPath.row].title
        cell.timeLabel.text = String( indexPath.row + 13) + ":" + String( indexPath.row * 2 + 10)
        cell.newsView.layer.cornerRadius = 25
        cell.backgroundColor = UIColor(red: 0.2039, green: 0.2157, blue: 0.2667, alpha: 1)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        
        label.frame = CGRect.init(x: 20, y: 5, width: headerView.frame.width - 10,
                                  height: headerView.frame.height - 10)
        label.text = "Latest news"
        label.font = UIFont(name: "MyriadPro-Regular", size: 22)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let curNewsVC = storyboard?.instantiateViewController(withIdentifier: "CurNewsViewController") as? CurNewsViewController else { return }
        curNewsVC.model = newsArray[indexPath.row]
        curNewsVC.modalPresentationStyle = .fullScreen
        present(curNewsVC, animated: true, completion: nil)
    }
}

// MARK: - Collection view data source, delegate

extension NewsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: idItem,
            for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
        item.backgroundImage.layer.cornerRadius = 30
        item.itemLabel.font = UIFont(name: "vetrino", size: 24)
        item.itemLabel.text = newsArray.reversed()[indexPath.item].title
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let curNewsVC = storyboard?.instantiateViewController(withIdentifier: "CurNewsViewController") as? CurNewsViewController else { return }
        curNewsVC.model = newsArray.reversed()[indexPath.item]
        curNewsVC.modalPresentationStyle = .fullScreen
        present(curNewsVC, animated: true, completion: nil)
        
    }
}
