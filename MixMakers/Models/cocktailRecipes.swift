//
//  cocktailRecipes.swift
//  MixMakers
//
//  Created by Louis Moselhi on 31/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import Foundation

struct cocktailRecipes:Decodable {
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
}
