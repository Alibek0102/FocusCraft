//
//  HomeViewController.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 21.03.2024.
//

import UIKit
import LZViewPager

class HomeViewController: UIViewController {
    
    var homeScreenEvents: homeScreenClosure?
    
    lazy var customHeader = Header()
    lazy var module = TaskFactory()
    
    lazy var viewPager: LZViewPager = {
        let viewPager = LZViewPager()
        viewPager.translatesAutoresizingMaskIntoConstraints = false
        return viewPager
    }()
    
    lazy var addTaskButton: UIButton = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton()
        button.backgroundColor = AppColors.denim
        button.layer.cornerRadius = 30
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        button.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        
        return button
    }()
    
    private var subcontrollers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor  = .white
        
        viewPager.dataSource = self
        viewPager.delegate = self
        viewPager.hostController = self
        
        self.setupHeader()
        self.viewPagerSetup()
        self.setupViewControllers()
        self.setupAddTaskButton()
        
        customHeader.menuClosure = { event in
            switch event {
            case .profile:
                self.homeScreenEvents?(.profile)
            case .exit:
                self.homeScreenEvents?(.exit)
            }
        }
        
        addTaskButton.addTarget(self, action: #selector(showCreateTaskView), for: .touchUpInside)
    }
    
    @objc private func showCreateTaskView() {
        self.homeScreenEvents?(.addTask)
    }
    
    private func setupViewControllers() {
        let allTaskViewController = module.createAllTasksViewController()
        let workViewController = module.createWorkViewController()
        let otherTasksViewController = module.createOtherTasksViewController()
        
        self.subcontrollers = [allTaskViewController, workViewController, otherTasksViewController]
        viewPager.reload()
    }
    
    private func setupHeader() {
        view.addSubview(customHeader)
        
        NSLayoutConstraint.activate([
            customHeader.leftAnchor.constraint(equalTo: view.leftAnchor),
            customHeader.rightAnchor.constraint(equalTo: view.rightAnchor),
            customHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func viewPagerSetup() {
        view.addSubview(viewPager)
        
        NSLayoutConstraint.activate([
            viewPager.topAnchor.constraint(equalTo: customHeader.bottomAnchor),
            viewPager.leftAnchor.constraint(equalTo: view.leftAnchor),
            viewPager.rightAnchor.constraint(equalTo: view.rightAnchor),
            viewPager.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupAddTaskButton() {
        view.addSubview(addTaskButton)
        
        NSLayoutConstraint.activate([
            addTaskButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            addTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

extension HomeViewController: LZViewPagerDelegate, LZViewPagerDataSource {
    func numberOfItems() -> Int {
        return subcontrollers.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subcontrollers[index]
    }

    func button(at index: Int) -> UIButton {        
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = AppFont.createFont(type: .medium, size: 18)
        return button
    }
    
    func widthForButton(at index: Int) -> CGFloat {
        let width = ((subcontrollers[index].title?.count ?? 0) * 10) + 50
        return CGFloat(width)
    }
    
    func leftMarginForHeader() -> CGFloat {
        return 22
    }
    
    func colorForSeparator() -> UIColor {
        return AppColors.lightGray
    }
    
    func heightForSeparator() -> CGFloat {
        return 2
    }
    
    func colorForIndicator(at index: Int) -> UIColor {
        return AppColors.dark
    }
    
    func heightForIndicator() -> CGFloat {
        return 5
    }
    
    func shouldShowSeparator() -> Bool {
        return true
    }

}
