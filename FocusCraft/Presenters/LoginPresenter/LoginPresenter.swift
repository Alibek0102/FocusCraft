//
//  LoginPresenter.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 27.03.2024.
//

import Foundation

final class LoginPresenter: LoginPresenterProtocol {
    
    var view: LoginViewProtocol
    
    init(view: LoginViewProtocol) {
        self.view = view
    }
    
    func signIn(email: String, password: String){
        guard checkEmail(email) == true else { return }
        guard checkPassword(password) == true else { return }
        
        AuthentificationService.shared.signIn(email: email, password: password) { response in
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

extension LoginPresenter: LoginPresenterStateProtocol {
    func checkEmail(_ email: String) -> Bool {
        if !emailHasNotSpace(email) {
            let response = LoginValidationResponse(state: .emailHaveSpace, color: .red)
            self.showState(state: response)
            return false
        }
        if !emailValidator(email) {
            let response = LoginValidationResponse(state: .emailUncorrect, color: .red)
            self.showState(state: response)
            return false
        }
        
        return true
    }
    
    func checkPassword(_ password: String) -> Bool {
        if !passwordValidator(password) {
            let response = LoginValidationResponse(state: .passwordUncorrect, color: .red)
            self.showState(state: response)
            return false
        }
        if !passwordHasNotSpace(password) {
            let response = LoginValidationResponse(state: .passwordHaveSpace, color: .red)
            self.showState(state: response)
            return false
        }
        if !isPasswordLengthValid(password) {
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

extension LoginPresenter: LoginValidatorProtocol {
    
    func emailValidator(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func emailHasNotSpace(_ email: String) -> Bool {
        if email.contains(" ") { return false }
        return true
    }
    
    func passwordValidator(_ password: String) -> Bool {
        return true
    }
    
    func passwordHasNotSpace(_ password: String) -> Bool {
        if password.contains(" ") { return false }
        return true
    }
    
    func isPasswordLengthValid(_ password: String) -> Bool {
        if password.count < 8 { return false }
        return true
    }
    
}
