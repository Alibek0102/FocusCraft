//
//  TaskItemCell.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 21.03.2024.
//

import UIKit

class TaskItemCell: UITableViewCell {
    
    var checkbox = CheckBox(frame: .zero)
    
    var taskFlag: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .flag
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return imageView
    }()
    
    var taskName: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        label.font = AppFont.createFont(type: .bold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var taskTime: UILabel = {
        let label = UILabel()
        label.text = "7:00 PM"
        label.font = AppFont.createFont(type: .regular, size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
        setupElements()
    }
    
    private func setupElements() {
        contentView.addSubview(checkbox)
        contentView.addSubview(taskFlag)
        
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [taskName, taskTime])
            stackView.axis = .vertical
            stackView.spacing = 3
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            checkbox.heightAnchor.constraint(equalToConstant: 25),
            checkbox.widthAnchor.constraint(equalToConstant: 25),
            checkbox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkbox.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 22),
            
            taskFlag.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -22),
            taskFlag.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: checkbox.rightAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: taskFlag.leftAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
