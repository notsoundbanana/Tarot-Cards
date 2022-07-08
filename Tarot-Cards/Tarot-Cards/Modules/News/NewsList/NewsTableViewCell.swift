//
//  NewsTableViewCell.swift
//  Tarot-Cards
//
//  Created by Полина Рыфтина on 05.07.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    // MARK: - UI
    
    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
