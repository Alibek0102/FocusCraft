//
//  AuthCoordinatable.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 20.03.2024.
//

import Foundation

enum navigationEvents {
    case login
    case register
}

protocol AuthCoordinator {
    func navigate(type: navigationEvents, router: NavigationType)
}
