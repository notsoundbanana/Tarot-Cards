//
//  CardViewController.swift
//  Tarot-Cards
//
//  Created by dn on 08.07.2022.
//

import UIKit

class CardViewController: UIViewController {
    @IBOutlet weak var cardNameLabel: UILabel!{
        didSet {
            cardNameLabel.text = tarotCard[0].name
        }
    }
    
    @IBOutlet weak var cardDiscriptionLabel: UILabel!{
        didSet {
            cardDiscriptionLabel.text = tarotCard[0].meaningUp
            cardDiscriptionLabel.sizeToFit()
        }
    }
    
    @IBOutlet weak var cardUIImageView: UIImageView!{
        didSet {
            cardUIImageView.image = UIImage(named: tarotCard[0].name)
        }
    }
    
    var tarotCard = [TarotCard]()
    var imageRotated = false
    
    private let dataManager = DataStoreManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.saveCard(tarotCard[0])
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
