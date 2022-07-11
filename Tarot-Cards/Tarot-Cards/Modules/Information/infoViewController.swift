//
//  infoViewController.swift
//  Tarot-Cards
//
//  Created by Лена Гусарова on 06.07.2022.
//

import UIKit

class infoViewController: UIViewController {

    
    @IBOutlet weak var bacgroundImage: UIImageView!
    
    @IBAction func aboutAppButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "info", message: "Гадание на таро — интересный и доступный способ узнать секреты о себе и других людях,а также  предсказать будущее. Колода Таро состоит из 78 карт: 22 старших аркана и 56 младших. Каждая карта меняет свое значение в зависимости от ее положения. В нашем проекте вы можете погрузиться в мир Таро!", preferredStyle: .alert)
        let okBTN = UIAlertAction(title: "окей", style: .default)
        alert.addAction(okBTN)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func creatorsButtonDidTap(_ sender: Any) {
        
        guard let creatVC = storyboard?.instantiateViewController(withIdentifier: "CreatorsTableViewController") else {return}

        present(creatVC, animated: true, completion: nil)
    }
    
    @IBAction func GitHubButtonDidTap(_ sender: Any) {
        if let url = URL(string: "https://github.com/notsoundbanana/Tarot-Cards") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
             
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
}



