//
//  CreatorsTableViewController.swift
//  Tarot-Cards
//
//  Created by Лена Гусарова on 07.07.2022.
//

struct Creators{
    let name: String
    let tgNick: String
}


import UIKit

class CreatorsTableViewController: UITableViewController {
    
    let creators : [Creators] = [
        Creators(name: "Polina", tgNick: "prfuh"),
        Creators(name: "Danil", tgNick: "notsoundbanana"),
        Creators(name: "Artem", tgNick: "str0nv"),
        Creators(name: "Elena", tgNick: "gusarowaaa"),
        Creators(name: "Andrey", tgNick: "Ludwig_Andreas")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return creators.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CreatorsTableViewCell", for: indexPath) as? CreatorsTableViewCell else {return UITableViewCell()}
        
        cell.configure(name: creators[indexPath.row].name)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        90
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let infoVC = storyboard?.instantiateViewController(withIdentifier: "infoCreatorsViewController") as?  infoCreatorsViewController else {return}
        
        infoVC.name = creators[indexPath.row].name
        infoVC.tgNick = creators[indexPath.row].tgNick
        
        present(infoVC, animated: true)
    }
}
