//
//  ingredientsTableViewCell.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/26/22.
//

import UIKit

// MARK: - IngredientsTableViewCell

class IngredientsTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var ingredientImageView: ImageView!
    
    @IBOutlet private weak var ingredientNameLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableViewCell()
    }

    func config(with ingredient: Ingredient) {
        ingredientNameLabel.text = ingredient.text
        ingredientImageView.fetchImage(from: ingredient.image!)
    }
    
}

// MARK: - Extension

extension IngredientsTableViewCell {
    private func setupTableViewCell() {
        selectionStyle = .none
        ingredientImageView.layer.cornerRadius = ingredientImageView.bounds.width / 2
    }
    
}
