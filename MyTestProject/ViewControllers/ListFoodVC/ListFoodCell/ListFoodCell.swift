//
//  ListFoodCell.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/15/22.
//

import UIKit

// MARK: - Extension

class ListFoodCell: UITableViewCell {
    
    // MARK: - IBOutlets
   
    @IBOutlet private weak var recipeImage: ImageView!
    
    @IBOutlet private weak var recipeAuthorLabel: UILabel!
    @IBOutlet private weak var recipeDescriptionLabel: UILabel!
    @IBOutlet private weak var recipeNameLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableViewCell()
    }
}

// MARK: - Extension

extension ListFoodCell {
    private func setupTableViewCell() {
        selectionStyle = .none
        recipeImage.layer.cornerRadius = recipeImage.bounds.width / 2
        recipeAuthorLabel.textColor = .white
        recipeNameLabel.textColor = .white
        recipeDescriptionLabel.textColor = .white
    }
    
    func config(with recipe: Recipe) {
        recipeImage.fetchImage(from: recipe.image)
        
        recipeNameLabel.text = recipe.label
        recipeDescriptionLabel.text = recipe.source
        recipeAuthorLabel.text = "Author: \(recipe.source)"
    }
}
