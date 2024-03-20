//
//  Header.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 21.03.2024.
//

import UIKit

class Header: UIView {
    
    lazy var appIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .listMaker
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return imageView
    }()
    
    lazy var appName: UILabel = {
        let label = UILabel()
        label.text = "FocusCraft"
        label.font = AppFont.createFont(type: .bold, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.setupHeader()
        self.setupAppEmblem()
    }
    
    private func setupHeader() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    private func setupAppEmblem() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(appIcon)
        stackView.addArrangedSubview(appName)
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 22)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
