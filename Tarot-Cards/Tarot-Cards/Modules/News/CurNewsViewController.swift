//
//  CurNewsViewController.swift
//  Tarot-Cards
//
//  Created by Полина Рыфтина on 07.07.2022.
//

import UIKit

class CurNewsViewController: UIViewController {
    
    var model: NewsData?
    
    // MARK: - UI
    
    @IBOutlet weak var backButtonLabel: UILabel!{
        didSet{
            backButtonLabel.isUserInteractionEnabled = true
            
            backButtonLabel.layer.masksToBounds = true
            backButtonLabel.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var newsTitleLabel: UILabel!{
        didSet{
            newsTitleLabel.text = model?.title
        }
    }
    @IBOutlet weak var newsImage: UIImageView!{
        didSet{
            newsImage.layer.cornerRadius = 30
            guard let imgName = model?.imgName else {return}
            newsImage.image = UIImage(named: imgName)
        }
    }
    @IBOutlet weak var backgroundScrollView: UIScrollView!{
        didSet{
            backgroundScrollView.layer.cornerRadius = 30
        }
    }
    @IBOutlet weak var articalTextLabel: UILabel!{
        didSet{
            articalTextLabel.text = model?.text
            articalTextLabel.numberOfLines = 500
        }
    }
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backButtonDidTab(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
