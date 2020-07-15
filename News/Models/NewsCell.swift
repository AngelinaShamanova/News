//
//  NewsCell.swift
//  News
//
//  Created by MacBook on 13/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet var imageNews: ImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    func configure(with news: Article) {
        
        self.titleLabel.text = news.title
        self.titleLabel.numberOfLines = 3
        
        self.descriptionLabel.text = news.description
        self.descriptionLabel.numberOfLines = 2
        
        imageNews.fetchImage(with: news.urlToImage)
        
    }
    
}


