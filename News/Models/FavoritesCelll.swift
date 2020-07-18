//
//  FavoritesCell.swift
//  News
//
//  Created by MacBook on 18/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {
    
    @IBOutlet var favoritesTitle: UILabel!
    @IBOutlet var favoritesDescription: UILabel!
    
    func configure(with news: FavoritesNewsDB) {
        
        self.favoritesTitle.text = news.titleOfFavNews
        self.favoritesTitle.numberOfLines = 3
        
        self.favoritesDescription.text = news.descriptionOfFavNews
        self.favoritesDescription.numberOfLines = 4
        
    }

}




