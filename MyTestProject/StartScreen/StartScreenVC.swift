//
//  StartScreenVC.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import UIKit

//MARK: - StartScreenVC

class StartScreenVC: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let presenter: StartScreenPresenterProtocol
    
    
    init(presenter: StartScreenPresenterProtocol) {
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
}

//MARK: - Private Extension

private extension StartScreenVC {
    func setupUI() {
        setupCollectionView()
        setupNavigationController()
    }
    
    func setupNavigationController() {
        title = "Recipies"
    }
    
    func setupCollectionView() {
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(.init(nibName: String(describing: UserActionCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: UserActionCell.self))
    }
}

extension StartScreenVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.userActions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UserActionCell.self), for: indexPath) as! UserActionCell
        
        let userAction = presenter.userActions[indexPath.item]
        
        cell.config(with: userAction.rawValue)
        
        return cell
    }
}

extension StartScreenVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 32, height: 100)
    }
}
