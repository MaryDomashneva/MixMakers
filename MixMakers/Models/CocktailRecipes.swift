//
//  cocktailRecipes.swift
//  MixMakers
//
//  Created by Louis Moselhi on 31/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import Foundation

struct CocktailRecipes:Decodable {
    let strInstructions: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strDrinkThumb: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let id: String
    let strDrink: String
    
    private enum CodingKeys: String, CodingKey
    {
        case strInstructions = "strInstructions"
        case strIngredient1 = "strIngredient1"
        case strIngredient2 = "strIngredient2"
        case strIngredient3 = "strIngredient3"
        case strIngredient4 = "strIngredient4"
        case strIngredient5 = "strIngredient5"
        case strIngredient6 = "strIngredient6"
        case strIngredient7 = "strIngredient7"
        case strIngredient8 = "strIngredient8"
        case strIngredient9 = "strIngredient9"
        case strIngredient10 = "strIngredient10"
        case strIngredient11 = "strIngredient11"
        case strIngredient12 = "strIngredient12"
        case strIngredient13 = "strIngredient13"
        case strIngredient14 = "strIngredient14"
        case strIngredient15 = "strIngredient15"
        case strDrinkThumb = "strDrinkThumb"
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case strMeasure5 = "strMeasure5"
        case strMeasure6 = "strMeasure6"
        case strMeasure7 = "strMeasure7"
        case strMeasure8 = "strMeasure8"
        case strMeasure9 = "strMeasure9"
        case strMeasure10 = "strMeasure10"
        case strMeasure11 = "strMeasure11"
        case strMeasure12 = "strMeasure12"
        case strMeasure13 = "strMeasure13"
        case strMeasure14 = "strMeasure14"
        case strMeasure15 = "strMeasure15"
        case id = "idDrink"
        case strDrink = "strDrink"
    }
    
    func ingredients() -> [String] {
        var result: [String] = []
        append(value: strIngredient1, to: &result)
        append(value: strIngredient2, to: &result)
        append(value: strIngredient3, to: &result)
        append(value: strIngredient4, to: &result)
        append(value: strIngredient5, to: &result)
        append(value: strIngredient6, to: &result)
        append(value: strIngredient7, to: &result)
        append(value: strIngredient8, to: &result)
        append(value: strIngredient9, to: &result)
        append(value: strIngredient10, to: &result)
        append(value: strIngredient11, to: &result)
        append(value: strIngredient12, to: &result)
        append(value: strIngredient13, to: &result)
        append(value: strIngredient14, to: &result)
        append(value: strIngredient15, to: &result)
        return result
    }
    
    func measures() -> [String] {
        var result: [String] = []
        append(value: strMeasure1, to: &result)
        append(value: strMeasure2, to: &result)
        append(value: strMeasure3, to: &result)
        append(value: strMeasure4, to: &result)
        append(value: strMeasure5, to: &result)
        append(value: strMeasure6, to: &result)
        append(value: strMeasure7, to: &result)
        append(value: strMeasure8, to: &result)
        append(value: strMeasure9, to: &result)
        append(value: strMeasure10, to: &result)
        append(value: strMeasure11, to: &result)
        append(value: strMeasure12, to: &result)
        append(value: strMeasure13, to: &result)
        append(value: strMeasure14, to: &result)
        append(value: strMeasure15, to: &result)
        return result
    }
    
    func append(value: String?, to array: inout [String]) {
        if let value = value, !value.isEmpty {
            array.append(value)
        }
    }
}
