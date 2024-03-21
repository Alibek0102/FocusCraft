//
//  CheckBox.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 21.03.2024.
//

import UIKit

class CheckBox: UIButton {
    
    var isChecked: Bool = false {
        didSet {
            DispatchQueue.main.async {
                if self.isChecked == true {
                    self.setImage(.checked, for: .normal)
                } else {
                    self.setImage(.nonChecked, for: .normal)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStartValue()
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setStartValue() {
        self.isChecked = false
        self.setImage(.nonChecked, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonClicked(sender: UIButton) {
        if sender == self {
            self.isChecked = !self.isChecked
        }
    }
    
}
