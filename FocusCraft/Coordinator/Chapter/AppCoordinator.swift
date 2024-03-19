//
//  AppCoordinator.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 19.03.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        loginFlow()
    }
    
    func loginFlow() {
        let loginCoordinator = LoginCoordinator(navigationController: self.navigationController)
        loginCoordinator.start()
    }
}
