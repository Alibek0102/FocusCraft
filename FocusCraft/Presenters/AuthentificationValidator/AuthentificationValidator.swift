//
//  AuthentificationValidator.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 30.03.2024.
//

import UIKit

final class AuthentificationValidator: AuthentificationValidatorProtocol {
    
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
    
    func matchPasswords(_ password1: String, _ password2: String) -> Bool {
        return password1 == password2
    }

}
