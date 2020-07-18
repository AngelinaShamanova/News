//
//  FavoritesViewController.swift
//  News
//
//  Created by MacBook on 15/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit
import RealmSwift

let realm = try! Realm()

class FavoritesViewController: UITableViewController {
    
    let news: Article? = nil
    
    var favoritesNews: Results<FavoritesNewsDB>!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesNews = realm.objects(FavoritesNewsDB.self)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesNews.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesCell
        
        let favNew = favoritesNews[indexPath.row]
        
        cell.configure(with: favNew)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let _ = self.deleteActoion(at: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [deleteActoion(at: indexPath)])
        return swipe
    }
    
    func deleteActoion(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Delete") { (_, _, _) in
            
            let favNews = self.favoritesNews[indexPath.row]
            
            try! realm.write {
                realm.delete(favNews)
            }
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return action
    }
    
}
