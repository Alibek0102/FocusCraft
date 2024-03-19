//
//  AppIcon.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 19.03.2024.
//

import UIKit

class AppIcon: UIView {
    
    lazy var appIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .listMaker
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        return imageView
    }()
    
    lazy var appName: UILabel = {
        let label = UILabel()
        label.text = "Focus craft"
        label.font = AppFont.createFont(type: .bold, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(){
        super.init(frame: .zero)
        self.setupElements()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupElements() {
        self.addSubview(appIcon)
        self.addSubview(appName)
        
        NSLayoutConstraint.activate([
            appIcon.topAnchor.constraint(equalTo: self.topAnchor),
            appIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            appName.topAnchor.constraint(equalTo: appIcon.bottomAnchor, constant: 15),
            appName.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
