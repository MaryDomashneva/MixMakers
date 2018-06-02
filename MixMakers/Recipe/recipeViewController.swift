//
//  recipeViewController.swift
//  MixMakers
//
//  Created by Louis Moselhi on 31/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import UIKit
import Nuke

class recipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum TableViewSection: Int {
        case Ingredients = 0
        case Instructions = 1
        
        func name() -> String {
            switch self {
            case .Instructions:
                return "Instructions"
            case .Ingredients:
                return "Ingredients"
            }
        }
        
        func height() -> CGFloat {
            return 60
        }
        
        static func numberOfSections() -> Int {
            return 2
        }
    }
    
    @IBOutlet weak var cocktailImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var recipeTableView: UITableView!
    
    var cocktail:SimpleCocktail?
    var recipe: CocktailRecipes?
    let recipeAPIService = RecipeService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTableView.rowHeight = UITableViewAutomaticDimension
        recipeTableView.estimatedRowHeight = 44
        recipeTableView.register(UINib(nibName: "RecipeInstructionTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeInstructionTableViewCell")
        recipeTableView.register(UINib(nibName: "RecipeIngredientTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipeIngredientTableViewCell")
        recipeTableView.register(UINib(nibName: "RecipeHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "RecipeHeaderView")
        
        loadRecipe(with: (cocktail?.id)!)


        // Do any additional setup after loading the view.
    }
    
    func loadRecipe(with ingredient: String) {
        recipeAPIService.getRecipe(with: (cocktail?.id)!)
        { [weak self] loadedRecipe, error in
            if let error = error {
                // Show error
            } else if let loadedRecipe = loadedRecipe {
                if loadedRecipe.isEmpty {
//                    self?.loadingLabel.text = "Recipe not found"
                } else {
                    self?.update(with: loadedRecipe)
                }
                
            } else {
                // Show unknown error
            }
        }
    }
    
    func update(with newRecipe: [CocktailRecipes]) {
        recipe = newRecipe.first
        if let strDrinkThumb = recipe?.strDrinkThumb, let imageURL = URL(string: strDrinkThumb) {
            Manager.shared.loadImage(with: imageURL, into: cocktailImage)
        }
        recipeTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableViewSection.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch TableViewSection.init(rawValue: section)! {
        case .Ingredients:
            return recipe?.ingredients().count ?? 0
        case .Instructions:
            return recipe?.strInstructions != nil ? 1 : 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if recipe == nil {
            return nil
        }
        let tableViewSection = TableViewSection.init(rawValue: section)!
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "RecipeHeaderView") as! RecipeHeaderView
        headerView.titleLabel.text = tableViewSection.name()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let tableViewSection = TableViewSection.init(rawValue: section)!
        return tableViewSection.height()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch TableViewSection.init(rawValue: indexPath.section)! {
        case .Ingredients:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeIngredientTableViewCell", for: indexPath) as! RecipeIngredientTableViewCell
            let ingredient = recipe?.ingredients()[indexPath.row]
            let measure = recipe?.measures()[indexPath.row]
            cell.ingredientLabel.text = ingredient
            cell.measureLabel.text = measure
            return cell
            
        case .Instructions:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeInstructionTableViewCell", for: indexPath) as! RecipeInstructionTableViewCell
            let instruction = recipe?.strInstructions
            cell.instructionLabel.text = instruction
            return cell
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY >= 0 {
            cocktailImageViewHeight.constant = 150
        } else {
            cocktailImageViewHeight.constant = 150 - offsetY
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
