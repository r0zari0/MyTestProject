//
//  FlowController.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import UIKit

class FlowController: UIViewController, UITabBarControllerDelegate {
    
    private var embedTabBarVC: UITabBarController = UITabBarController()
    
    private lazy var startVC: UIViewController = instantiateStartVC()
    private lazy var favoriteFoodVC: UIViewController = favoriteListFoodVC()
    
    let navigator: NavigatorProtocol
    let networking: NetworkingProtocol
    let coreData: CoreDataStoreProtocol
    
    init(navigator: NavigatorProtocol, networking: NetworkingProtocol, coreData: CoreDataStoreProtocol) {
        self.navigator = navigator
        self.networking = networking
        self.coreData = coreData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupTabBar()
        setUIAppearanceCustomNavBar(type: .opaque)
    }
    
    func setupTabBar() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().tintColor = .white
    }
}

extension FlowController {
    func instantiateStartVC() -> UIViewController {
        let presenter = FoodCollectionViewPresenter(navigator: navigator)
        let vc = FoodCollectionViewVC(presenter: presenter)
        let navigationVC = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Recipies", image: UIImage(systemName: "book.fill"), selectedImage: UIImage(systemName: "book.fill")
        )
        return navigationVC
    }
    
    func favoriteListFoodVC() -> UIViewController {
        let presenter = ListFoodPresenter(
            navigator: navigator,
            networking: networking,
            coreData: coreData,
            type: .chicken,
            screenType: .favoriteRecipe
        )
        
        let vc = ListFoodVC(presenter: presenter)
        presenter.view = vc
        let navigationVC = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Favorites", image: UIImage(named: "tabBarHeart"),
            selectedImage: UIImage(named: "tabBarHeartSelected")
        )
        
        return navigationVC
    }
    
}

private extension FlowController {
    func initialSetup() {
        view.backgroundColor = .black
        embedTabBarVC.delegate = self
        embedTabBarVC.viewControllers = [startVC, favoriteFoodVC]
        embedTabBarVC.tabBar.isTranslucent = false
        embedTabBarVC.tabBar.tintColor = .black
        embedTabBarVC.tabBar.unselectedItemTintColor = .gray
        addChild(embedTabBarVC, toContainer: view)
    }
}
