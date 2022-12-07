//
//  UserActionCell.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/12/22.
//

import UIKit

// MARK: - UserActionCell

class UserActionCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var foodLabel: UILabel!
    @IBOutlet private weak var foodImageView: UIImageView!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Func
    
    func config(with title: String, type: RecipeType) {
        foodLabel.text = title
        foodImageView.image = type.image
    }
}

// MARK: - Extension

extension UserActionCell {
    func setupUI() {
        backgroundColor = .black
        layer.cornerRadius = 8
    }
}
