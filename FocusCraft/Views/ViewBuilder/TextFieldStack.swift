//
//  TextFieldStack.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 19.03.2024.
//

import UIKit

class TextFieldStack: UIStackView {
    
    lazy var textFieldTitle: UILabel = {
        let label = UILabel()
        
        label.font = AppFont.createFont(type: .medium)
        label.textColor = AppColors.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.axis = .vertical
        
        textFieldTitle.text = title
        spacing = 3
        addArrangedSubview(textFieldTitle)
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
