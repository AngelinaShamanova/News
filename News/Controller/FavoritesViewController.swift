//
//  FavoritesViewController.swift
//  News
//
//  Created by MacBook on 15/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit
import RealmSwift

class FavoritesViewController: UITableViewController {
    
    let realm = try! Realm()
    let news: Article? = nil
    let favNews = FavoritesNewsDB()
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
        cell.favoritesTitle.text = favNew.titleOfFavNews
        cell.favoritesTitle.numberOfLines = 3
        
        cell.favoritesDescription.text = favNew.descriptionOfFavNews
        cell.favoritesDescription.numberOfLines = 2
        
//        cell.favoritesImage.fetchImage(with: favNews.urlToImageOfFavNews)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

  
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
}
