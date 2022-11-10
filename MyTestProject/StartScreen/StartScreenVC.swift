//
//  StartScreenVC.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import UIKit

class StartScreenVC: UIViewController {

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
    }
}
