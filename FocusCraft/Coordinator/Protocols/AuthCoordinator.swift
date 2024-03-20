//
//  AuthCoordinatable.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 20.03.2024.
//

import Foundation

enum AuthNavigationEvents {
    case login
    case register
}

protocol AuthCoordinator {
    func navigate(type: AuthNavigationEvents, router: NavigationType)
}
