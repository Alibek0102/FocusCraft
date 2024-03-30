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
