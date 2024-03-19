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
        return viewController
    }
    
    func createRegistrationScreen() -> RegistrationViewController {
        let viewController = RegistrationViewController()
        return viewController
    }
    
}
