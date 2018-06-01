//
//  cocktailRecipes.swift
//  MixMakers
//
//  Created by Louis Moselhi on 31/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import Foundation

struct CocktailRecipes:Decodable {
    let strInstructions: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strDrinkThumb: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let id: String
    let strDrink: String
    
    private enum CodingKeys: String, CodingKey
    {
        case strInstructions = "strInstructions"
        case strIngredient1 = "strIngredient1"
        case strIngredient2 = "strIngredient2"
        case strIngredient3 = "strIngredient3"
        case strIngredient4 = "strIngredient4"
        case strDrinkThumb = "strDrinkThumb"
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case id = "idDrink"
        case strDrink = "strDrink"
    }
}
