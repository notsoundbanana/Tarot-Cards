//
//  CardViewController.swift
//  Tarot-Cards
//
//  Created by dn on 08.07.2022.
//

import UIKit

class CardViewController: UIViewController {
    var cardName = ""
    var cardDiscription = ""

    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardDiscriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardNameLabel.text = cardName
    }
}
