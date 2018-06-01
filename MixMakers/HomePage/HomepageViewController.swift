//
//  HomepageViewController.swift
//  MixMakers
//
//  Created by Jack Dewinter on 30/05/2018.
//  Copyright © 2018 MixMakers. All rights reserved.
//

import UIKit
import TTGTagCollectionView
import SwiftGifOrigin

class HomepageViewController: UIViewController, TTGTextTagCollectionViewDelegate {

    @IBOutlet weak var searchTerm: UITextField!
    @IBOutlet weak var tagsContainerView: UIView!
    @IBOutlet weak var gifImageView: UIImageView!
    
    var tagsCollectionView: TTGTextTagCollectionView!
    
    @IBAction func searchPressed(_ sender: Any) {
        if let searchText = searchTerm.text, !searchText.isEmpty {
            let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
            resultView.searchTerm = searchTerm.text!
            navigationController?.pushViewController(resultView, animated: true)
        } else {
            let emptySearchAlert = UIAlertController(title: "Please, enter ingredient!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            emptySearchAlert.addAction(okButton)
            present(emptySearchAlert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func vodkaPressed(_ sender: Any) {
        let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
        resultView.searchTerm.append("Vodka")
        navigationController?.pushViewController(resultView, animated: true)
    }
    
    @IBAction func ginPressed(_ sender: Any) {
        let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
        resultView.searchTerm.append("Gin")
        navigationController?.pushViewController(resultView, animated: true)
    }
    
    @IBAction func tequilaPressed(_ sender: Any) {
        let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
        resultView.searchTerm.append("Tequila")
        navigationController?.pushViewController(resultView, animated: true)
    }
    
    @IBAction func brandyPressed(_ sender: Any) {
        let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
        resultView.searchTerm.append("Brandy")
        navigationController?.pushViewController(resultView, animated: true)
    }
    
    @IBAction func rumPressed(_ sender: Any) {
        let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
        resultView.searchTerm.append("Rum")
        navigationController?.pushViewController(resultView, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gif = UIImage.gif(url: "https://mattsko.files.wordpress.com/2013/07/dancing-cocktail-shaker.gif")
        
        self.gifImageView.image = gif

        tagsCollectionView = TTGTextTagCollectionView(frame: tagsContainerView.bounds)
        
        // Add tags to the container view
        var tagCongfig = TTGTextTagConfig()
        tagCongfig.tagShadowColor = UIColor.clear
        tagCongfig.tagCornerRadius = 2
        tagCongfig.tagSelectedCornerRadius = 2
        tagCongfig.tagBorderWidth = 0
        tagCongfig.tagSelectedBorderWidth = 0
        tagCongfig.tagBackgroundColor = UIColor(white: 0.75, alpha: 1)
        tagCongfig.tagSelectedBackgroundColor = UIColor(white: 0.23, alpha: 1)
        tagsContainerView.addSubview(tagsCollectionView)
        tagsCollectionView.alignment = .left
        tagsCollectionView.defaultConfig = tagCongfig
        tagsCollectionView.contentInset = UIEdgeInsets.zero
        tagsCollectionView.addTags(Ingredients.popular)
        tagsCollectionView.delegate = self
    }
    
    // Called whenever screen is going to be rendered
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tagsCollectionView.frame = tagsContainerView.bounds
    }
    
    // MARK: - TTGTextTagCollectionView
    
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, didTapTag tagText: String!, at index: UInt, selected: Bool, tagConfig config: TTGTextTagConfig!) {
        if selected {
            let resultView = storyboard?.instantiateViewController(withIdentifier: "Cocktails") as! CocktailListViewController
            resultView.searchTerm = tagText
            navigationController?.pushViewController(resultView, animated: true)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 10000000)) {
                textTagCollectionView.setTagAt(index, selected: false)
            }
        }
    }
}
