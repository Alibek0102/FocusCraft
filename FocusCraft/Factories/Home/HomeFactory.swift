//
//  HomeFactory.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 21.03.2024.
//

import Foundation

class HomeFactory {
    
    func createHomeViewController() -> HomeViewController {
        let viewController = HomeViewController()
        return viewController
    }
    
    func createEditTaskViewController() -> CreateTaskViewController {
        let viewController = CreateTaskViewController()
        return viewController
    }
    
}
