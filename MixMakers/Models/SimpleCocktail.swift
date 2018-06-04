//
//  cockteil_list.swift
//  MixMakers
//
//  Created by Maria Getmanova on 29/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//


//JSON: javascrip object notation

import Foundation

struct SimpleCocktail: Codable, Equatable, Hashable
{
    let name: String
    let imageURLString: String
    let id: String
    
    private enum CodingKeys: String, CodingKey
    {
        case name = "strDrink"
        case imageURLString = "strDrinkThumb"
        case id = "idDrink"
    }
    
    public static func == (lhs: SimpleCocktail, rhs: SimpleCocktail) -> Bool {
        return lhs.name == rhs.name &&
               lhs.imageURLString == rhs.imageURLString &&
               lhs.id == rhs.id
    }
}
