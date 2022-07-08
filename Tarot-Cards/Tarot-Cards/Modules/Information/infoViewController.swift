//
//  infoViewController.swift
//  Tarot-Cards
//
//  Created by Лена Гусарова on 06.07.2022.
//

import UIKit

class infoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func aboutAppButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "info", message: "наш проект откроет вам мир удивительных карт таро", preferredStyle: .alert)
        let okBTN = UIAlertAction(title: "ок ок", style: .default)
        alert.addAction(okBTN)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func creatorsButtonDidTap(_ sender: Any) {
        
        guard let creatVC = storyboard?.instantiateViewController(withIdentifier: "CreatorsTableViewController") else {return}
        navigationController?.pushViewController(creatVC, animated: true)
        
        
    }
    
    @IBAction func GitHubButtonDidTap(_ sender: Any) {
        if let url = URL(string: "https://github.com/notsoundbanana/Tarot-Cards") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
        
    }
}



