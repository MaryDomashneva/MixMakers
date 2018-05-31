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
    var searchTerm = ""
    
    @IBOutlet var tableView: UITableView! //link code and view
    
    var cocktails: [SimpleCocktail] = []
    let cocktailAPIService = CocktailService()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        if cocktails.count == 0 {
            let alert = UIAlertController(title: nil, message: "Loading \(searchTerm) cocktails...", preferredStyle: .alert)
            
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            loadingIndicator.startAnimating();
            
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
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
            if let error = error {
                // Show error
            } else if let loadedCocktails = loadedCocktails {
                self?.update(with: loadedCocktails)
            } else {
                // Show unknown error
            }
        }
    }
    
    func update(with newCocktails: [SimpleCocktail]) {
        dismiss(animated: false, completion: nil)
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
