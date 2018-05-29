//
//  CocktailListViewController.swift
//  MixMakers
//
//  Created by Maria Getmanova on 29/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import UIKit

class CocktailListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var tableView: UITableView! //link code and view
    
    var cocktails: [SimpleCoctail] = []
    let cocktailAPIService = CocktailService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CocktailListView", bundle: nil), forCellReuseIdentifier: "CocktailListTableViewCell")
        loadCocktails(with: "Gin")
    }
    
    // MARK: - Helpers
    
    func loadCocktails(with ingredient: String) {
        cocktailAPIService.getAllCocktails(with: ingredient)
        { [weak self] loadedCocktails, error in
            if let error = error {
                // Show error
            } else if let loadedCocktails = loadedCocktails {
                self?.update(with: loadedCocktails)
            } else {
                // Show unknown error
            }
        }
    }
    
    func update(with newCocktails: [SimpleCoctail]) {
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
