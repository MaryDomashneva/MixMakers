//
//  CocktailListTableViewCell.swift
//  MixMakers
//
//  Created by Maria Getmanova on 29/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import UIKit
import Nuke

class CocktailListTableViewCell: UITableViewCell {
    @IBOutlet var cocktailNameLabel: UILabel!
    @IBOutlet var cocktailImageView: UIImageView!
    
    func configure(with simpleCocktail: SimpleCoctail) {
        cocktailNameLabel.text = simpleCocktail.name
        if let imageURL = URL(string: simpleCocktail.imageURLString) {
            Manager.shared.loadImage(with: imageURL, into: cocktailImageView)
        }
    }
}
