//
//  TaskFactory.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 21.03.2024.
//

import UIKit

class TaskFactory {
    func createAllTasksViewController() -> AllTasksViewController {
        let viewController = AllTasksViewController()
        viewController.title = "All"
        return viewController
    }
    
    func createWorkViewController() -> WorkViewController {
        let viewController = WorkViewController()
        viewController.title = "Work"
        return viewController
    }
    
    func createOtherTasksViewController() -> OtherTasksViewController {
        let viewController = OtherTasksViewController()
        viewController.title = "Other"
        return viewController
    }
}
