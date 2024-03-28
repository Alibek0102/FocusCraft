//
//  LoginPresenterProtocols.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 27.03.2024.
//

import Foundation

protocol LoginPresenterProtocol {
    func signIn(email: String, password: String)
}

protocol LoginViewProtocol {
    var presenter: LoginPresenterProtocol? { get set }
    
    func authHandler(result: LoginValidationResponse)
    func loaderHandler(_ loader: Bool)
}

protocol LoginPresenterStateProtocol {
    func showState(state: LoginValidationResponse)
    func checkEmail(_ email: String) -> Bool
    func checkPassword(_ password: String) -> Bool
}

protocol LoginValidatorProtocol {
    func emailValidator(_ email: String) -> Bool
    func emailHasNotSpace(_ email: String) -> Bool
    func passwordValidator(_ password: String) -> Bool
    func passwordHasNotSpace(_ password: String) -> Bool
    func isPasswordLengthValid(_ password: String) -> Bool
}
