//
//  LoginPresenter.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 27.03.2024.
//

import Foundation

final class LoginPresenter: LoginPresenterProtocol {
    
    var view: LoginViewProtocol
    lazy var validator = AuthentificationValidator()
    
    init(view: LoginViewProtocol) {
        self.view = view
    }
    
    func signIn(email: String, password: String){
        view.loaderHandler(true)
        
        guard checkEmail(email) == true else { 
            view.loaderHandler(false)
            return
        }
        guard checkPassword(password) == true else { 
            view.loaderHandler(false)
            return
        }
        
        AuthentificationService.shared.signIn(email: email, password: password) { response in
            
            self.view.loaderHandler(false)
            
            switch response {
            case .success:
                self.showState(state: LoginValidationResponse(state: .success, color: .green))
            case .dataUncorrect:
                self.showState(state: LoginValidationResponse(state: .passwordUncorrect, color: .red))
            case .serverError:
                self.showState(state: LoginValidationResponse(state: .passwordUncorrect, color: .red))
            }
            
        }
    }
}

extension LoginPresenter: AuthPresentersStateProtocol {
    func checkEmail(_ email: String) -> Bool {
        if !validator.emailHasNotSpace(email) {
            let response = LoginValidationResponse(state: .emailHaveSpace, color: .red)
            self.showState(state: response)
            return false
        }
        if !validator.emailValidator(email) {
            let response = LoginValidationResponse(state: .emailUncorrect, color: .red)
            self.showState(state: response)
            return false
        }
        
        return true
    }
    
    func checkPassword(_ password: String) -> Bool {
        if !validator.passwordValidator(password) {
            let response = LoginValidationResponse(state: .passwordUncorrect, color: .red)
            self.showState(state: response)
            return false
        }
        if !validator.passwordHasNotSpace(password) {
            let response = LoginValidationResponse(state: .passwordHaveSpace, color: .red)
            self.showState(state: response)
            return false
        }
        if !validator.isPasswordLengthValid(password) {
            let response = LoginValidationResponse(state: .passwordMinLength, color: .red)
            self.showState(state: response)
            return false
        }
        
        return true
    }
    
    func showState(state: LoginValidationResponse) {
        view.authHandler(result: state)
    }
}

