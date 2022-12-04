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
    @IBOutlet weak var ingredientImageView: ImageView!
    
    @IBOutlet weak var ingredientNameLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableViewCell()
    }
    
    private func setupTableViewCell() {
        selectionStyle = .none
        ingredientImageView.layer.cornerRadius = ingredientImageView.bounds.width / 2
    }
    
    func config(with ingredient: Ingredient) {
        ingredientNameLabel.text = ingredient.text
        ingredientImageView.fetchImage(from: ingredient.image!)
    }
    
}
