//
//  AppCoordinator.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 19.03.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var isAuth: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isAuth == true {
            self.mainFlow()
        } else {
            self.loginFlow()
        }
    }
    
    func loginFlow() {
        let loginCoordinator = LoginCoordinator(navigationController: self.navigationController)
        loginCoordinator.finishFLow = { isDone in
            if isDone == true {
                self.isAuth = true
                self.start()
            }
        }
        loginCoordinator.start()
    }
    
    func mainFlow() {
        let mainCoordinator = MainCoordinator(navigationController: self.navigationController)
        mainCoordinator.finishFLow = { isExit in
            if isExit == true {
                self.isAuth = false
                self.start()
            }
        }
        
        mainCoordinator.start()
    }
}
