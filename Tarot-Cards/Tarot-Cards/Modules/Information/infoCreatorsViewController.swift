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
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
    }
    

    @IBAction func infoButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
