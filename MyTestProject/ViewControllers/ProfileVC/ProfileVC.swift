//
//  ProfileVC.swift
//  MyTestProject
//
//  Created by Max Stovolos on 12/29/22.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileButton: UIButton!
    
    let presenter: ProfilePresenter
    
    init(presenter: ProfilePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        profileImageView.layer.cornerRadius = 16
        profileButton.layer.cornerRadius = 6
        
        view.backgroundColor = .black
        
    }
}
