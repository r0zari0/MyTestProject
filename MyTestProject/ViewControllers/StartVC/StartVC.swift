//
//  StartVC.swift
//  MyTestProject
//
//  Created by Max Stovolos on 12/3/22.
//

import UIKit

// MARK: - StartVC

class StartVC: UIViewController {

    // MARK: - Life Cycle

    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var cookBookLabel: UILabel!
    @IBOutlet private weak var firstLabel: UILabel!
    @IBOutlet private weak var secondLabel: UILabel!
    @IBOutlet private weak var thirdLabel: UILabel!
    
    @IBOutlet private weak var showSecondScreen: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
      // MARK: - Properties
    
    let presenter: StartPresenterProtocol
    
    //MARK: - Init
    
    init(presenter: StartPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        firstLabel.text = "Wellcome !"
        secondLabel.text = "Looking for a great home-cooked meal?"
        thirdLabel.text = "Log in these app, and you'll be cooking it up in no time"
        cookBookLabel.text = "Cook Book"
        
        imageView.image = UIImage(named: "startScreenImage")
    }
}

// MARK: - IBActions

extension StartVC {
    @IBAction func showTabBarButton() {
        presenter.showFoodCollectionViewVC(view: self)
    }
}
