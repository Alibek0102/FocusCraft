//
//  LoginCoordinator.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 19.03.2024.
//

import UIKit

class LoginCoordinator: Coordinator, SubCoordinator, AuthCoordinator {
    
    var navigationController: UINavigationController
    var finishFLow: boolClosure?
    
    lazy var module = AuthentificationFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        loginScreen()
    }
    
    func navigate(type: AuthNavigationEvents, router: NavigationType) {
        switch type {
        case .login:
            loginScreen(router)
            break
        case .register:
            registrationScreen(router)
            break
        }
    }
    
    private func loginScreen(_ type: NavigationType = .push) {
        let viewController = module.createLoginViewController()
        viewController.coordinator = self
        
        viewController.finishFlow = { isDone in
            if isDone == true {
                self.finishFLow?(true)
            }
        }
        
        navigationController.navigate(viewController: viewController, type: type)
    }
    
    private func registrationScreen(_ type: NavigationType = .push) {
        let viewController = module.createRegistrationScreen()
        viewController.coordinator = self
        
        viewController.finishFlow = { isDone in
            if isDone == true {
                self.finishFLow?(true)
            }
        }
        
        navigationController.navigate(viewController: viewController, type: type)
    }
    
}

