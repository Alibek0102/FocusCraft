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
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return imageView
    }()
    
    lazy var appName: UILabel = {
        let label = UILabel()
        label.text = "FocusCraft"
        label.font = AppFont.createFont(type: .bold, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.menu, for: .normal)
        button.tintColor = AppColors.dark
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        button.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.setupHeader()
        self.setupAppEmblem()
        self.setupProfileButton()
        self.setActionsForButton()
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
    
    private func setupProfileButton() {
        self.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -22),
            menuButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setActionsForButton() {
        let showProfile = UIAction(title: "Profile", image: UIImage(systemName: "person")) { action in
            print("profile")
        }
        
        let exitFromAccount = UIAction(title: "Exit", image: UIImage(systemName: "door.right.hand.open")) { action in
            print("exit")
        }
        
        let menu = UIMenu(children: [showProfile, exitFromAccount])
        
        menuButton.menu = menu
        menuButton.showsMenuAsPrimaryAction = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
