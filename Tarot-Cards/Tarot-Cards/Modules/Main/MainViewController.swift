//
//  MainViewController.swift
//  Tarot-Cards
//
//  Created by dn on 04.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let dataManager = DataStoreManager()
    
    @IBOutlet private var cardUIImageView: UIImageView!{
        didSet {
            cardUIImageView.isUserInteractionEnabled = true
        }
    }
    @IBOutlet weak var rotateUIButton: UIButton!
    @IBOutlet weak var infoUIButton: UIButton!
    
    var networkCardManager = NetworkCardManager()
    var tarotCards = [TarotCard]()
    
    var randomInt = 1
    
    override func viewWillAppear(_ animated: Bool) {
        networkCardManager.onCompletion = { [unowned self]  recivedTarotCards in
            self.tarotCards = recivedTarotCards
            DispatchQueue.main.async {
                
            }
        }
        networkCardManager.fetchAllCards()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.prepareForWork()
    }
    
    @IBAction func cardImageDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CardView", bundle: nil)
        
        guard let cardVC = storyboard.instantiateViewController(withIdentifier: "CardViewController") as? CardViewController else { return }
        
        cardVC.tarotCard.append(tarotCards[randomInt - 1]) // Passing selected card
        
        cardVC.modalPresentationStyle = .fullScreen
        present(cardVC, animated: true, completion: nil)
    }
    
    @IBAction func randomButtonDidTap(_ sender: Any) {
        generateRandomCard()
    }
    
    func generateRandomCard(){
        randomInt = Int.random(in: 1...77)
        UIView.transition(with: cardUIImageView, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        
        cardUIImageView.image = UIImage(named: tarotCards[randomInt - 1].name)
    }
    
}
