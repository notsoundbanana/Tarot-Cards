//
//  CurNewsViewController.swift
//  Tarot-Cards
//
//  Created by Полина Рыфтина on 07.07.2022.
//

import UIKit

class CurNewsViewController: UIViewController {
    
    var model: News?
    

    // MARK: - UI
    
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    @IBOutlet weak var articalTextLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var backgroundButtonView: UIView!
    @IBAction func backButtonDidTab(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - View life cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsImage.layer.cornerRadius = 30
        backgroundScrollView.layer.cornerRadius = 30
        backgroundButtonView.layer.cornerRadius = 15
        newsTitleLabel.text = model?.articalName
        articalTextLabel.text = model?.articalText
        articalTextLabel.numberOfLines = 500
    }
}
