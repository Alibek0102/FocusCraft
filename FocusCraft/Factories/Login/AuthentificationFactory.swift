//
//  AuthentificationFactory.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 19.03.2024.
//

import UIKit

class AuthentificationFactory {
    
    func createLoginViewController() -> LoginViewController {
        let viewController = LoginViewController()
        let presenter = LoginPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
    func createRegistrationScreen() -> RegistrationViewController {
        let viewController = RegistrationViewController()
        var presenter = RegistrationPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
}
