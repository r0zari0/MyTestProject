//
//  ingredientsTableViewCell.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/26/22.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientImageView: UIImageView!
    
    @IBOutlet weak var ingredientNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(with ingredient: Ingredient) {
        ingredientNameLabel.text = ingredient.text
        if let ingredientImage = ingredient.image {
            ingredient.loadAsyncImage(image: ingredientImage) { image in
                self.ingredientImageView.image = image
            }
        }
    }
    
}
