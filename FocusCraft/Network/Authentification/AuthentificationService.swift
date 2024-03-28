//
//  Authentification.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 27.03.2024.
//

import UIKit
import FirebaseAuth


class AuthentificationService {
    static let shared = AuthentificationService()
    
    private let authRef = Auth.auth()
    
    private init(){}
    
    func createUser(email: String, password: String, completionHandler: @escaping ( AuthentificationResponse ) -> Void){
        authRef.createUser(withEmail: email, password: password) { result, error in
            guard result != nil else {
                if error != nil {
                    completionHandler(.dataUncorrect)
                }
                
                return
            }
            
            completionHandler(.success)
        }
    }
    
    func signIn(email: String, password: String, completionHandler: @escaping ( AuthentificationResponse ) -> Void){
        authRef.signIn(withEmail: email, password: password) { result, error in
            guard result != nil else {
                if error != nil {
                    completionHandler(.dataUncorrect)
                }
                return
            }
            
            completionHandler(.success)
        }
    }
    
    func signOut(completionHandler: @escaping (AuthentificationResponse) -> Void) {
        do {
            try authRef.signOut()
            completionHandler(.success)
        } catch {
            completionHandler(.serverError)
        }
    }
    
}
