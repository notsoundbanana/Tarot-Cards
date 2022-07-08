//
//  CardSearchCollectionViewCell.swift
//  Tarot-Cards
//
//  Created by LudwigAndreas on 07.07.2022.
//

import UIKit

class CardSearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImgageView: UIImageView!
    @IBOutlet weak var cardLabel: UILabel!
    
    func setup(with card: TarotCard) {
        cardImgageView?.image = card.tarrotCardIcon
        cardLabel?.text = card.name.uppercased()
    }
}
