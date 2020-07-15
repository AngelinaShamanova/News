//
//  NetworkService.swift
//  News
//
//  Created by MacBook on 12/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (News?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error!")
                    completion(nil, error)
                    return
                }
                guard let data = data else { return }
                
                do {
                    let news = try JSONDecoder().decode(News.self, from: data)
                    completion(news, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(nil, jsonError)
                }
                
            }
        }.resume()
    }
    
}
