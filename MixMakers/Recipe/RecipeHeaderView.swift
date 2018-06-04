//
//  RecipeHeaderView.swift
//  MixMakers
//
//  Created by Andrew Kemp on 02/06/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import UIKit

class RecipeHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet var titleLabel: UILabel!
    
    override var reuseIdentifier: String? {
        return "RecipeHeaderView"
    }
}
