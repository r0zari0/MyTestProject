//
//  FlowController.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import UIKit

class FlowController: UIViewController, UITabBarControllerDelegate {
    
    private var embedTabBarVC: UITabBarController = UITabBarController()
    
    private lazy var startVC: UINavigationController = instantiateStartVC()
    
    let navigator: NavigatorProtocol
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupTabBar()
    }
    
    private func setupTabBar() {
        UITabBar.appearance().tintColor = .white 
    }
}

extension FlowController {
    func instantiateStartVC() -> UINavigationController {
        let presenter = FoodCollectionViewPresenter(navigator: navigator)
        let vc = FoodCollectionViewVC(presenter: presenter)
        let navigationVC = UINavigationController(rootViewController: vc)
        vc.tabBarItem = UITabBarItem(
            title: "Recipies", image: UIImage(systemName: "book.fill"), selectedImage: UIImage(systemName: "book.fill")
        )
        return navigationVC
    }
}

private extension FlowController {
    func initialSetup() {
        view.backgroundColor = .black
        embedTabBarVC.delegate = self
        embedTabBarVC.viewControllers = [startVC]
        embedTabBarVC.tabBar.isTranslucent = false
        embedTabBarVC.tabBar.tintColor = .black
        embedTabBarVC.tabBar.unselectedItemTintColor = .black
        addChild(embedTabBarVC, toContainer: view)
    }
}
