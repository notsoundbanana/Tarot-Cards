//
//  CreatorsTableViewCell.swift
//  Tarot-Cards
//
//  Created by Лена Гусарова on 07.07.2022.
//

import UIKit

class CreatorsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(name: String) {
        nameLabel.text = name
    }
}
