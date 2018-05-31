//
//  CocktailListViewController.swift
//  MixMakers
//
//  Created by Maria Getmanova on 29/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class CocktailListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var searchTerm = ""
    
    @IBOutlet var tableView: UITableView! //link code and view
    @IBOutlet var nvActivityIndicatorView: NVActivityIndicatorView! //link code and view
    @IBOutlet var loadingLabel: UILabel! //link code and view
    @IBOutlet var loadingContainerView: UIView! //link code and view
    
    var cocktails: [SimpleCocktail] = []
    let cocktailAPIService = CocktailService()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if cocktails.count == 0 {
            tableView.isHidden = true
            loadingContainerView.isHidden = false
            loadingLabel.text = "Loading \(searchTerm) cocktails..."
            nvActivityIndicatorView.startAnimating()
        } else {
            tableView.isHidden = false
            loadingContainerView.isHidden = true
        }
        
        tableView.register(UINib(nibName: "CocktailListView", bundle: nil), forCellReuseIdentifier: "CocktailListTableViewCell")
        loadCocktails(with: searchTerm)
    }
    
    // MARK: - Helpers
    
    func getSearchTerm() -> String {
        return searchTerm
    }
    
    func loadCocktails(with ingredient: String) {
        cocktailAPIService.getAllCocktails(with: ingredient)
        { [weak self] loadedCocktails, error in
            self?.nvActivityIndicatorView.stopAnimating()
            if let error = error {
                // Show error
            } else if let loadedCocktails = loadedCocktails {
                self?.tableView.isHidden = false
                self?.loadingContainerView.isHidden = true
                self?.update(with: loadedCocktails)
            } else {
                // Show unknown error
            }
        }
    }
    
    func update(with newCocktails: [SimpleCocktail]) {
        cocktails = newCocktails
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailListTableViewCell", for: indexPath) as! CocktailListTableViewCell
        let simpleCocktail = cocktails[indexPath.row]
        cell.configure(with: simpleCocktail)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Implement row selection logic
    }
}
