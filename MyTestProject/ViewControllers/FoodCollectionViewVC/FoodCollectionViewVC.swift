//
//  StartScreenVC.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import UIKit

// MARK: - StartScreenVC

class FoodCollectionViewVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    private let presenter: FoodCollectionViewPresenterProtocol
    private let networking: Networking = Networking()
    
    // MARK: - Init
    
    init(presenter: FoodCollectionViewPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

    // MARK: - Private Extension

private extension FoodCollectionViewVC {
    func setupUI() {
        setupCollectionView()
        setupNavigationController()
    }
    
    func setupNavigationController() {
        title = "Recipies" 
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupCollectionView() {
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(.init(nibName: String(describing: UserActionCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: UserActionCell.self))
    }
}

extension FoodCollectionViewVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.showListFoodVC(indexPath: indexPath.item, view: self, screenType: .internetRecipe)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.recipeTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UserActionCell.self), for: indexPath) as! UserActionCell
        
        let userAction = presenter.recipeTypes[indexPath.item]
        
        cell.config(with: userAction.rawValue, type: userAction)
        
        return cell
    }
}

extension FoodCollectionViewVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 32, height: 150
        )
    }
}
