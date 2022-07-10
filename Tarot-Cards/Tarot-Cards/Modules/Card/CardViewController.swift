//
//  CardViewController.swift
//  Tarot-Cards
//
//  Created by dn on 08.07.2022.
//

import UIKit

class CardViewController: UIViewController {
    var tarotCard = [TarotCard]()
    

    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardDiscriptionLabel: UILabel!
    @IBOutlet weak var cardUIImageView: UIImageView!
    var imageRotated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardUIImageView.image = UIImage(named: tarotCard[0].name)
        cardNameLabel.text = tarotCard[0].name
        cardDiscriptionLabel.text = tarotCard[0].meaningUp
        cardDiscriptionLabel.sizeToFit()
    }
    
    @IBAction func backButtonDidTab(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
    
    @IBAction func rotateButtonDidTap(_ sender: Any) {
        if !imageRotated {
            UIView.animate(withDuration: 0.5, animations: {
                self.cardUIImageView.transform = CGAffineTransform(rotationAngle: .pi)
            })
            cardDiscriptionLabel.text = tarotCard[0].meaningRev
            imageRotated = true
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {
                self.cardUIImageView.transform = CGAffineTransform(rotationAngle: 0)
            })
            cardDiscriptionLabel.text = tarotCard[0].meaningUp
            imageRotated = false
        }
    }
}
