//
//  RegistrationProtocol.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 30.03.2024.
//

import UIKit

protocol RegistrationPresenterProtocol {
    func signUp(email: String, password: String, secondPassword: String)
}

protocol RegistrationViewProtocol {
    var presenter: RegistrationPresenterProtocol? { get set }
    
    func authHandler(result: LoginValidationResponse)
    func loaderHandler(_ loader: Bool)
}

protocol CheckMatchPasswordsProtocol {
    func matchPasswords(_ password1: String, password2: String) -> Bool
}

