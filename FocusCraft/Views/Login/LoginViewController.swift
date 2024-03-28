//
//  LoginViewController.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 19.03.2024.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {

    var coordinator: AuthCoordinator?
    var finishFlow: boolClosure?
    var presenter: LoginPresenterProtocol?
    
    lazy var appIcon = AppIcon()
    
    lazy var emailStack = TextFieldStack(title: "Email")
    lazy var emailTextField = CustomTextField(placeholder: "Enter your email")
    
    lazy var passwordStack = TextFieldStack(title: "Password")
    lazy var passwordTextField = CustomTextField(placeholder: "Enter your password")
    
    lazy var authButton = AuthButton(title: "Log in")
    
    lazy var toSignUpLabel: UILabel = CustomAttributedText(text1: "Don't have an account?", text2: " Sign Up")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupElements()
        signUpLabelSettings()
        authButtonSettings()
    }
    
    func signUpLabelSettings() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigationManager))
        toSignUpLabel.isUserInteractionEnabled = true
        toSignUpLabel.addGestureRecognizer(gestureRecognizer)
    }
    
    func authButtonSettings() {
        authButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    func setupElements() {
        view.addSubview(appIcon)
        view.addSubview(emailStack)
        view.addSubview(passwordStack)
        view.addSubview(authButton)
        view.addSubview(toSignUpLabel)
        
        emailStack.addArrangedSubview(emailTextField)
        passwordStack.addArrangedSubview(passwordTextField)
        
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
            
            authButton.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 40),
            authButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            authButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            
            toSignUpLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            toSignUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func navigationManager() {
        coordinator?.navigate(type: .register, router: .push)
    }
    
    @objc private func login() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        self.presenter?.signIn(email: email, password: password)
    }
    
}

extension LoginViewController {
    func authHandler(result: LoginValidationResponse) {
        switch result.state {
        case .emailUncorrect:
            print("неправильный email")
        case .passwordUncorrect:
            print("неправильный пароль или email")
        case .emailHaveSpace:
            print("неправильный пароль или email")
        case .passwordHaveSpace:
            print("неправильный пароль или email")
        case .passwordMinLength:
            print("неправильный пароль или email")
        case .success:
            self.finishFlow?(true)
        }
    }
}
