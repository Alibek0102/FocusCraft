//
//  RegistrationViewController.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 20.03.2024.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    var coordinator: AuthCoordinator?
    
    lazy var appIcon = AppIcon()
    
    lazy var emailStack = TextFieldStack(title: "Email")
    lazy var emailTextField = CustomTextField(placeholder: "Enter your email")
    
    lazy var passwordStack = TextFieldStack(title: "Password")
    lazy var passwordTextField = CustomTextField(placeholder: "Enter your password")
    
    lazy var confirmPasswordStask = TextFieldStack(title: "Confirm password")
    lazy var confirmPasswordTextField = CustomTextField(placeholder: "Confirm your password")
    
    lazy var authButton = AuthButton(title: "Sign Up")
    
    lazy var toSignInLabel: UILabel = CustomAttributedText(text1: "Have an account?", text2: " Sign In")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupElements()
        signInLabelSettings()
    }
    
    func signInLabelSettings() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigationManager))
        toSignInLabel.isUserInteractionEnabled = true
        toSignInLabel.addGestureRecognizer(gestureRecognizer)
    }
    
    func setupElements() {
        view.addSubview(appIcon)
        view.addSubview(emailStack)
        view.addSubview(passwordStack)
        view.addSubview(confirmPasswordStask)
        view.addSubview(authButton)
        view.addSubview(toSignInLabel)
        
        emailStack.addArrangedSubview(emailTextField)
        passwordStack.addArrangedSubview(passwordTextField)
        confirmPasswordStask.addArrangedSubview(confirmPasswordTextField)
        
        NSLayoutConstraint.activate([
            appIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            appIcon.widthAnchor.constraint(equalToConstant: view.frame.width),
            appIcon.heightAnchor.constraint(equalToConstant: 110),
            
            emailStack.topAnchor.constraint(equalTo: appIcon.bottomAnchor, constant: 30),
            emailStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            emailStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            
            passwordStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor, constant: 20),
            passwordStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            passwordStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            
            confirmPasswordStask.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 20),
            confirmPasswordStask.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            confirmPasswordStask.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            
            authButton.topAnchor.constraint(equalTo: confirmPasswordStask.bottomAnchor, constant: 40),
            authButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            authButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            
            toSignInLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            toSignInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    @objc private func navigationManager() {
        coordinator?.navigate(type: .login, router: .pop)
    }
    
}
