//
//  HeaderCell.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 21.03.2024.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    var sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = AppFont.createFont(type: .bold, size: 20)
        label.textColor = AppColors.dark
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var sectionPointer: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .downIcon
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
        self.setupElements()
    }
    
    func setupElements() {
        contentView.addSubview(sectionLabel)
        contentView.addSubview(sectionPointer)
        
        NSLayoutConstraint.activate([
            sectionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            sectionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 22),
            
            sectionPointer.leftAnchor.constraint(equalTo: sectionLabel.rightAnchor, constant: 10),
            sectionPointer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
