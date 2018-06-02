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
    
    @IBOutlet var tableView: UITableView! //link code and view
    @IBOutlet var nvActivityIndicatorView: NVActivityIndicatorView! //link code and view
    @IBOutlet var loadingLabel: UILabel! //link code and view
    @IBOutlet var loadingContainerView: UIView! //link code and view
    
    var searchTerm: [(String)]  = []
    var cocktails: [SimpleCocktail] = []
    var manyCocktails: [[SimpleCocktail]] = []
    let cocktailAPIService = CocktailService()
    var currentTerm = 0
    let combineSearch = CombineSearch()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if cocktails.count == 0 {
            tableView.isHidden = true
            loadingContainerView.isHidden = false
            loadingLabel.text = "Loading \(searchTerm[currentTerm]) cocktails..."
            nvActivityIndicatorView.startAnimating()
        } else {
            tableView.isHidden = false
            loadingContainerView.isHidden = true
        }
        
        tableView.register(UINib(nibName: "CocktailListView", bundle: nil), forCellReuseIdentifier: "CocktailListTableViewCell")
        loadCocktails(with: ["Milk", "Chocolate"], current: currentTerm)
    }
    
    func loadCocktails(with ingredients: Array<String>, current: Int) {
        cocktailAPIService.getAllCocktails(with: ingredients[current])
        { [weak self] loadedCocktails, error in
            self?.nvActivityIndicatorView.stopAnimating()
            if let error = error {
                // Show error
            } else if let loadedCocktails = loadedCocktails {
                if loadedCocktails.isEmpty {
                    self?.loadingLabel.text = "Cocktails not found"
                } else {
                    if current != ingredients.count - 1 {
                        self?.manyCocktails.append(loadedCocktails)
                        let currentTerm = current + 1
                        self?.loadCocktails(with: ingredients, current: currentTerm)
                    }
                    else {
                        self?.manyCocktails.append(loadedCocktails)
                        let cocktails = self?.combineSearch.combine(with: (self?.manyCocktails)!)
                        self?.tableView.isHidden = false
                        self?.loadingContainerView.isHidden = true
                        self?.update(with: cocktails!)
                    }
                    // recursively call this until all ingredients in search term array are satisfied. Then only update the view with the common cocktails. An error or empty result will cancel the whole search as there will be no common cocktails
                }
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
