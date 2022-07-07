//
//  MainViewController.swift
//  Tarot-Cards
//
//  Created by dn on 04.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var cardUIImageView: UIImageView!
    @IBOutlet weak var rotateUIButton: UIButton!
    @IBOutlet weak var infoUIButton: UIButton!
    var imageRotated = false

    
    func roundCorners(imageView: UIImageView){
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 20.0
        imageView.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundCorners(imageView: cardUIImageView)
        rotateUIButton.imageEdgeInsets = UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)
        infoUIButton.imageEdgeInsets = UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)
        
        
    }
    
    @IBAction func rotateButton(_ sender: Any) {
        if !imageRotated {
            UIView.animate(withDuration: 0.5, animations: {
                self.cardUIImageView.transform = CGAffineTransform(rotationAngle: .pi)
            })
            imageRotated = true
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {
                self.cardUIImageView.transform = CGAffineTransform(rotationAngle: 0)
            })
            imageRotated = false
        }
    }
}
