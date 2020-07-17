//
//  FavoritesNewsDB.swift
//  News
//
//  Created by MacBook on 17/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import RealmSwift

class FavoritesNewsDB: Object {
    
    @objc dynamic var titleOfFavNews = ""
    @objc dynamic var descriptionOfFavNews = ""
    @objc dynamic var urlToImageOfFavNews = ""
    
}
