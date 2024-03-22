//
//  UINavigationController+Extension.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 20.03.2024.
//

import UIKit

enum NavigationType {
    case set
    case push
    case pop
}

extension UINavigationController {
    func navigate(viewController: UIViewController?, type: NavigationType) {
        switch type {
        case .set:
            if let vc = viewController {
                self.setViewControllers([vc], animated: false)
            }
            break
        case .push:
            if let vc = viewController {
                self.pushViewController(vc, animated: true)
            }
            break
        case .pop:
            self.popViewController(animated: true)
            break
        }
    }
}

