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
        
        if combined.count == 2 {
            intersection = combined[0].intersection(combined[1])
        }
        else if combined.count == 3 {
            intersection = combined[0].intersection(combined[1])
            intersection = intersection.intersection(combined[2])
        }
        else {
            intersection = combined[0]
        }
        

        print(intersection)
        return Array(intersection)
    }
}
