//
//  ViewController.swift
//  News
//
//  Created by MacBook on 12/07/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var table: UITableView!
    
    let myRefreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    let networkService = NetworkService()
    var news: News? = nil
    
    private var timer: Timer?
    let urlString = "http://newsapi.org/v2/top-headlines?country=us&apiKey=340a3e652a6a4e7bb3537f611303cc29"
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.networkService.request(urlString: urlString) { [weak self] (news, error) in
            news?.articles.map({ (new) in
                self?.news = news
                self?.table.reloadData()
            })
        }
        
        setupTableView()
        setupSearchBar()
        
        
        //        myRefreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        //        table.refreshControl = myRefreshControl
        
    }
    
    
    @objc private func refresh(sender: UIRefreshControl) {
        table.reloadData()
        myRefreshControl.endRefreshing()
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func setupTableView() {
        table.delegate = self
        table.dataSource = self
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.articles.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        
        guard let new = news?.articles[indexPath.row] else { return cell }
        cell.configure(with: new)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func addToFavorites(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Add to favorites") { (_, _, _) in
            
        }
        return action
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let _ = self.addToFavorites(rowIndexPathAt: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [addToFavorites(rowIndexPathAt: indexPath)])
        
        
        
        return swipe
    }
    
}



extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let urlString = "http://newsapi.org/v2/top-headlines?q=\(searchText)&country=us&apiKey=340a3e652a6a4e7bb3537f611303cc29"
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkService.request(urlString: urlString) { [weak self] (news, error) in
                news?.articles.map({ (new) in
                    self?.news = news!
                    self?.table.reloadData()
                })
            }
        })
        
    }
}


