//
//  FavoritesCell.swift
//  News
//
//  Created by MacBook on 15/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {
    
    @IBOutlet var favoritesTitle: UILabel!
    @IBOutlet var favoritesDescription: UILabel!
    @IBOutlet var favoritesImage: UIImageView!
    
    func configure(with news: Article) {
        
        DispatchQueue.global().async {
            
            guard let imageUrl = URL(string: news.urlToImage ?? "") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.favoritesImage.image = UIImage(data: imageData)
                
                self.favoritesTitle.text = news.title
                self.favoritesTitle.numberOfLines = 3
                
                self.favoritesDescription.text = news.description
                self.favoritesDescription.numberOfLines = 2
                
                
            }
        }
        
    }

}
