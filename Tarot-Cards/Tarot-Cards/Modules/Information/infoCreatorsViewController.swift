//
//  infoCreatorsViewController.swift
//  Tarot-Cards
//
//  Created by Лена Гусарова on 10.07.2022.
//

import UIKit

class infoCreatorsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var TextAboutCreators: UITextView!
    var name = String()
    var tgNick = String()
    @IBOutlet weak var AvatarImage: UIImageView!{
        didSet{
            AvatarImage.image = UIImage(named: name)
            AvatarImage.layer.masksToBounds = true
            AvatarImage.layer.cornerRadius = AvatarImage.bounds.width / 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
    }
    
    
    @IBAction func infoButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func telegramButtonDidTap(_ sender: Any) {
        if let url = URL(string: "https://t.me/\(tgNick)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
