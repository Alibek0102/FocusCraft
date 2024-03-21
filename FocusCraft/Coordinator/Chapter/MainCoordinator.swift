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
    
    func startEvent(event: HomeScreenEvents) {
        switch event {
        case .addTask:
            print("add task")
        case .exit:
            finishFLow?(true)
        case .profile:
            print("profile")
        }
    }
    
    private func homeScreen() {
        let viewController = module.createHomeViewController()
        viewController.homeScreenEvents = { event in
            self.startEvent(event: event)
        }
        
        navigationController.navigate(viewController: viewController, type: .set)
    }
    
    
}
