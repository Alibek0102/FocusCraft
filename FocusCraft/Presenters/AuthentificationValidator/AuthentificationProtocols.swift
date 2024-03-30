//
//  AuthentificationProtocols.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 30.03.2024.
//

import Foundation

protocol AuthentificationValidatorProtocol {
    func emailValidator(_ email: String) -> Bool
    func emailHasNotSpace(_ email: String) -> Bool
    func passwordValidator(_ password: String) -> Bool
    func passwordHasNotSpace(_ password: String) -> Bool
    func isPasswordLengthValid(_ password: String) -> Bool
}

protocol AuthPresentersStateProtocol {
    func showState(state: LoginValidationResponse)
    func checkEmail(_ email: String) -> Bool
    func checkPassword(_ password: String) -> Bool
}
