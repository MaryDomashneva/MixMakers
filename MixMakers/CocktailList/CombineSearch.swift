//
//  CombineSearch.swift
//  MixMakers
//
//  Created by Jack Dewinter on 02/06/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import Foundation

class CombineSearch {
    
    func combine(with manyCocktails: [[SimpleCocktail]]) -> [SimpleCocktail]{
        var combined:[Set<SimpleCocktail>] = []
        var intersection: Set<SimpleCocktail> = []
        for cocktailList in manyCocktails {
            combined.append(Set(cocktailList))
        }
        for i in 1...combined.count {
            intersection = combined[i - 1].intersection(combined[0])
        }
        return Array(intersection)
    }
}
