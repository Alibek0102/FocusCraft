//
//  MainCoordinator.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 19.03.2024.
//

import UIKit

class MainCoordinator: Coordinator, SubCoordinator {
    
    var navigationController: UINavigationController
    var finishFLow: boolClosure?
    
    lazy var module = HomeFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        homeScreen()
    }
    
    private func homeScreen() {
        let viewController = module.createHomeViewController()
        
        navigationController.navigate(viewController: viewController, type: .set)
    }
    
    
}
