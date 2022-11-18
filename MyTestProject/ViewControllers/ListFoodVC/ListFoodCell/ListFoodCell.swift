//
//  ListFoodCell.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/15/22.
//

import UIKit

class ListFoodCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeAuthorLabel: UILabel!
    @IBOutlet weak var recipeDescriptionLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableViewCell()
    }
}

 extension ListFoodCell {
     private func setupTableViewCell() {
    
     }
     
     func config(with recipe: Recipe) {
         recipe.loadAsyncImage(image: recipe.image, closure: { image in
             self.recipeImage.image = image
         })
         recipeNameLabel.text = recipe.label
         recipeDescriptionLabel.text = recipe.source
         recipeAuthorLabel.text = recipe.source
     }
}
