//
//  CustomTextField.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 19.03.2024.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeholder: String){
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        
        self.setupTextField()
        self.paddindSetup()
        self.borderSetup()
    }
    
    func setupTextField() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func paddindSetup() {
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        self.leftViewMode = .always
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        self.rightViewMode = .always
    }
    
    func borderSetup() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = AppColors.lightGray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
