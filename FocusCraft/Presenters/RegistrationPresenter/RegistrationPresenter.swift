//
//  RegistrationPresenter.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 30.03.2024.
//

import UIKit

final class RegistrationPresenter: RegistrationPresenterProtocol {
    
    var view: RegistrationViewProtocol
    lazy var validator = AuthentificationValidator()
    
    init(view: RegistrationViewProtocol) {
        self.view = view
    }
    
    func signUp(email: String, password: String, secondPassword: String) {
        view.loaderHandler(true)
        
        guard checkEmail(email) == true else { 
            view.loaderHandler(false)
            return
        }
        guard checkPassword(password) == true else {
            view.loaderHandler(false)
            return
        }
        guard matchPasswords(password, password2: secondPassword) else { 
            view.loaderHandler(false)
            return
        }
        
        AuthentificationService.shared.createUser(email: email, password: password) { response in
            
            self.view.loaderHandler(false)
            
            switch response {
            case .success:
                self.showState(state: LoginValidationResponse(state: .success, color: .green))
            case .dataUncorrect:
                self.showState(state: LoginValidationResponse(state: .passwordUncorrect, color: .green))
            case .serverError:
                self.showState(state: LoginValidationResponse(state: .passwordUncorrect, color: .green))
            }
        }
        
    }

}


extension RegistrationPresenter: AuthPresentersStateProtocol, CheckMatchPasswordsProtocol {
    
    func showState(state: LoginValidationResponse) {
        view.authHandler(result: state)
    }
    
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
    
    func matchPasswords(_ password1: String, password2: String) -> Bool {
        if !validator.matchPasswords(password1, password2) {
            let response = LoginValidationResponse(state: .passwordUncorrect, color: .red)
            self.showState(state: response)
            return false
        }
        
        return true
    }
}
