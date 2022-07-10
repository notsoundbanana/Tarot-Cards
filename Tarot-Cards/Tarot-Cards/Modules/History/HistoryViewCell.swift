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
    
    override func awakeFromNib() {
            super.awakeFromNib()
        
        titleCardLabel.font = UIFont(name: "MyriadPro-Regular", size: 15)
        titleCardLabel.layer.cornerRadius = 10
        subtitleCardLabel.layer.cornerRadius = 10
        titleCardLabel.textColor = .black
        subtitleCardLabel.textColor = .black
        titleCardLabel.layer.masksToBounds = true
        subtitleCardLabel.layer.masksToBounds = true
        titleCardLabel.backgroundColor = .white
        subtitleCardLabel.backgroundColor = .white
        
    }
}
