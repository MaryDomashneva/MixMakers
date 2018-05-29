//
//  cockteil_list.swift
//  MixMakers
//
//  Created by Maria Getmanova on 29/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//


//JSON: javascrip object notation

import Foundation

struct SimpleCoctail: Codable
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
}
