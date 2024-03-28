//
//  LoginState.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 28.03.2024.
//

import UIKit

enum LoginState {
    case emailUncorrect
    case passwordUncorrect
    case emailHaveSpace
    case passwordHaveSpace
    case passwordMinLength
    case success
}

struct LoginValidationResponse {
    let state: LoginState
    let color: UIColor
}
