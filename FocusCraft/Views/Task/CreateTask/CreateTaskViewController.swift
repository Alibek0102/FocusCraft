//
//  CreateTaskViewController.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 22.03.2024.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    lazy var header = HeaderWithCloseButton(title: "New Task")
    
    lazy var textViewDescription: UILabel = {
        let label = UILabel()
        label.text = "What are you planning?"
        label.font = AppFont.createFont(type: .medium)
        label.textColor = AppColors.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = AppColors.lightGray
        textView.font = AppFont.createFont(type: .medium)
        textView.textContainerInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        textView.layer.cornerRadius = 10
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return textView
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.tintColor = AppColors.gray
        datePicker.preferredDatePickerStyle = .compact
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return datePicker
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add New Task", for: .normal)
        button.backgroundColor = AppColors.denim
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        self.setupHeader()
        self.setupTextView()
        self.setupDatePickerAndButton()
        
        header.finishFlow = { result in
            if result {
                self.dismiss(animated: true)
            }
        }
    }
    
    private func setupHeader() {
        view.addSubview(header)
        
        NSLayoutConstraint.activate([
            header.heightAnchor.constraint(equalToConstant: 70),
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func setupTextView() {
        view.addSubview(textViewDescription)
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textViewDescription.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            textViewDescription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            textViewDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            
            textView.topAnchor.constraint(equalTo: textViewDescription.bottomAnchor, constant: 5),
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22)
        ])
    }
    
    
    
    private func setupDatePickerAndButton() {
        view.addSubview(datePicker)
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 15),
            datePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            datePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            submitButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            submitButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -20)
        ])
    }
    
}
