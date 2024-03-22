//
//  HeaderWithCloseButton.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 22.03.2024.
//

import UIKit

class HeaderWithCloseButton: UIView {
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        
        button.setImage(.close, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        return button
    }()
    
    var finishFlow: boolClosure?
    
    lazy var pageTitle: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.dark
        label.font = AppFont.createFont(type: .bold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.pageTitle.text = title
        self.setupElements()
        self.closeButton.addTarget(self, action: #selector(finishPage), for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func finishPage() {
        self.finishFlow?(true)
    }
    
    private func setupElements() {
        self.addSubview(closeButton)
        self.addSubview(pageTitle)
        
        NSLayoutConstraint.activate([
            closeButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -22),
            closeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            pageTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pageTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
