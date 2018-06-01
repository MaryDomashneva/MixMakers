//
//  recipeViewController.swift
//  MixMakers
//
//  Created by Louis Moselhi on 31/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import UIKit

class recipeViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var ingredients: UILabel!
    @IBOutlet weak var instructions: UILabel!
    
    var cocktail:SimpleCocktail?
    
    var recipe: [CocktailRecipes] = []
    let recipeAPIService = RecipeService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadRecipe(with: (cocktail?.id)!)
        
        ingredients.text = recipe.strIngredient1

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
        recipe = newRecipe
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
