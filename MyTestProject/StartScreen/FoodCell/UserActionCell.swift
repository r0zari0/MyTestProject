//
//  UserActionCell.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/12/22.
//

import UIKit

class UserActionCell: UICollectionViewCell {

    @IBOutlet weak private var foodLabel: UILabel!
    @IBOutlet weak private var foodImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .green
        setupUI()
    }
    func config(with title: String) {
        foodLabel.text = title
    }
}

extension UserActionCell {
    func setupUI() {
        layer.cornerRadius = 8
    }
}
