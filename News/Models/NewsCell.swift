//
//  NewsCell.swift
//  News
//
//  Created by MacBook on 13/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet var imageNews: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var fillFavoriteButton: UIButton!
    
    func configure(with news: Article) {
        
        DispatchQueue.global().async {
            
            guard let imageUrl = URL(string: news.urlToImage ?? "") else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.imageNews.image = UIImage(data: imageData)
                
                self.titleLabel.text = news.title
                self.titleLabel.numberOfLines = 3
                
                self.descriptionLabel.text = news.description
                self.descriptionLabel.numberOfLines = 2
                
                
            }
        }
        
    }
    
}
