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
    var finalCocktails: [SimpleCocktail] = []
    var manyCocktails: [[SimpleCocktail]] = []
    let cocktailAPIService = CocktailService()
    var currentTerm = 0
    let combineSearch = CombineSearch()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if finalCocktails.count == 0 {
            tableView.isHidden = true
            loadingContainerView.isHidden = false
            loadingLabel.text = "Loading cocktails..."
            nvActivityIndicatorView.startAnimating()
        } else {
            tableView.isHidden = false
            loadingContainerView.isHidden = true
        }
        
        tableView.register(UINib(nibName: "CocktailListView", bundle: nil), forCellReuseIdentifier: "CocktailListTableViewCell")
        loadCocktails(with: searchTerm, current: currentTerm)
    }
    
    func loadCocktails(with ingredients: Array<String>, current: Int) {
        cocktailAPIService.getAllCocktails(with: ingredients[current])
        { [weak self] loadedCocktails, error in
            print(current)
            if let error = error {
                print(error)
            } else if let loadedCocktails = loadedCocktails {
                    if current != ingredients.count - 1 {
                        self?.manyCocktails.append(loadedCocktails)
                        let currentTerm = current + 1
                        self?.loadCocktails(with: ingredients, current: currentTerm)
                    }
                    else {
                        self?.nvActivityIndicatorView.stopAnimating()
                        self?.manyCocktails.append(loadedCocktails)
                        self?.finalCocktails = (self?.combineSearch.combine(with: (self?.manyCocktails)!))!
                        if (self?.finalCocktails.isEmpty)! {
                            self?.loadingLabel.text = "Cocktails not found"
                        }
                        else {
                            
                            let results = self?.finalCocktails
                            self?.tableView.isHidden = false
                            self?.update(with: results!)
                        }
                    }
                    // recursively call this until all ingredients in search term array are satisfied. Then only update the view with the common cocktails. An error or empty result will cancel the whole search as there will be no common cocktails
            } else {
                // Show unknown error
            }
        }
    }
    
    
    func update(with newCocktails: [SimpleCocktail]) {
        self.cocktails = newCocktails.sorted(by: { $0.name < $1.name })
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cocktails.count == 1 {
            return 1
        } else {
            return Int(ceilf(Float(cocktails.count / 2)))
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailListTableViewCell", for: indexPath) as! CocktailListTableViewCell
        let row = indexPath.row * 2
        let simpleCocktail = cocktails[row]
        var anotherSimpleCocktail: SimpleCocktail? = nil
        if cocktails.count > row + 1 {
            anotherSimpleCocktail = cocktails[row + 1]
        }
        cell.configure(with: simpleCocktail, and: anotherSimpleCocktail)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstContentVC = storyboard.instantiateViewController(withIdentifier: "RecipeViewController") as! recipeViewController
        firstContentVC.cocktail = simpleCocktail
        cell.cocktailOneCard.shouldPresent(firstContentVC, from: self, fullscreen: false)
        
        if let anotherSimpleCocktail = anotherSimpleCocktail {
            let secondContentVC = storyboard.instantiateViewController(withIdentifier: "RecipeViewController") as! recipeViewController
            secondContentVC.cocktail = anotherSimpleCocktail
            cell.cocktailTwoCard.shouldPresent(secondContentVC, from: self, fullscreen: false)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showRecipe", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? recipeViewController {
            destination.cocktail = cocktails[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}
