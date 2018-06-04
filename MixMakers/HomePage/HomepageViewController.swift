//
//  HomepageViewController.swift
//  MixMakers
//
//  Created by Jack Dewinter on 30/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import UIKit
import SearchTextField

class HomepageViewController: UIViewController {


    
    
    @IBOutlet weak var searchIngredientsText: SearchTextField!
    

    @IBAction func searchPressed(_ sender: Any) {
        if let searchText = searchIngredientsText.text, !searchText.isEmpty {
            let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
            resultView.searchTerm.append(searchIngredientsText.text!)
            navigationController?.pushViewController(resultView, animated: true)
        } else {
            let emptySearchAlert = UIAlertController(title: "Please, enter ingredient!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            emptySearchAlert.addAction(okButton)
            present(emptySearchAlert, animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchField()
    }
    
    func configureSearchField() {
        searchIngredientsText.startVisibleWithoutInteraction = true
        searchIngredientsText.filterStrings(["Vodka", "Gin", "Tequila"])
    }
    
    // Called whenever screen is going to be rendered
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

}
