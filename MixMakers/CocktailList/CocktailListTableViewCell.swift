//
//  CocktailListTableViewCell.swift
//  MixMakers
//
//  Created by Maria Getmanova on 29/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import UIKit
import Nuke
import Cards

class CocktailListTableViewCell: UITableViewCell {
    
    @IBOutlet var cocktailOneCard: CardArticle!
    @IBOutlet var cocktailTwoCard: CardArticle!
    
    var cocktailOne: SimpleCocktail?
    var cocktailTwo: SimpleCocktail?
    
    func configure(with simpleCocktail: SimpleCocktail, and anotherSimpleCoctail: SimpleCocktail?) {
        cocktailOne = simpleCocktail
        cocktailTwo = anotherSimpleCoctail
        configure(card: cocktailOneCard, with: simpleCocktail)
        if let anotherSimpleCoctail = anotherSimpleCoctail {
            cocktailTwoCard.isHidden = false
            configure(card: cocktailTwoCard, with: anotherSimpleCoctail)
        } else {
            cocktailTwoCard.isHidden = true
        }
    }
    
    func configure(card: CardArticle, with cocktail: SimpleCocktail) {
        card.title = cocktail.name
        card.titleSize = 22
        card.backgroundColor = UIColor(red: 202.0/256.0, green: 201.0/256.0, blue: 211.0/256.0, alpha: 1)
        card.subtitle = ""
        card.category = ""
        card.textColor = UIColor.white
        card.backgroundImage = nil
        
        if let url = URL(string: cocktail.imageURLString) {
            Manager.shared.loadImage(with: url) { [weak self] result in
                switch result {
                case .success(let loadedImage):
                    if self?.cocktailOne?.id == cocktail.id || self?.cocktailTwo?.id == cocktail.id {
                        card.backgroundImage = loadedImage
                    }
                case .failure(_): break
                }
            }
        }
    }
}
