//
//  HistoryViewCell.swift
//  Tarot-Cards
//
//  Created by Artyom Mitrofanov on 10.07.2022.
//

import UIKit


class HistoryViewCell: UICollectionViewCell {
    @IBOutlet weak var titleCardLabel: UILabel! 
    @IBOutlet weak var subtitleCardLabel: UILabel!
    @IBOutlet weak var cardImgageView: UIImageView!
    
    func setupRecentCard(with card: TarotCard) {
        cardImgageView?.image = card.tarrotCardIcon
        titleCardLabel?.text = card.name.uppercased()
        subtitleCardLabel?.text = card.meaningUp
        subtitleCardLabel.sizeToFit()
    }
}
