//
//  CustomAttributedText.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 20.03.2024.
//

import UIKit

class CustomAttributedText: UILabel {
    
    init(text1: String, text2: String) {
        super.init(frame: .zero)
        
        self.font = AppFont.createFont(type: .regular)
        
        let attribute: [NSAttributedString.Key : Any] = [
            .font: AppFont.createFont(type: .bold)
        ]
        let attributedText = NSMutableAttributedString(string: text1)
        attributedText.append(
            NSAttributedString(string: text2, attributes: attribute)
        )
        
        self.attributedText = attributedText
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
