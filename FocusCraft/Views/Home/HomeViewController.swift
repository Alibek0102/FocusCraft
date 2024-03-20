//
//  HomeViewController.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 21.03.2024.
//

import UIKit
import LZViewPager

class HomeViewController: UIViewController {
    
    lazy var customHeader = Header()
    
    lazy var viewPager: LZViewPager = {
        let viewPager = LZViewPager()
        viewPager.translatesAutoresizingMaskIntoConstraints = false
        return viewPager
    }()
    
    lazy var testViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.title = "Work"
        return viewController
    }()
    
    lazy var testViewController2: UIViewController = {
        let viewController = UIViewController()
        viewController.title = "All"
        return viewController
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
        
        subcontrollers.append(testViewController)
        subcontrollers.append(testViewController2)
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
            viewPager.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            viewPager.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7)
        ])
    }
    
}

extension HomeViewController: LZViewPagerDelegate, LZViewPagerDataSource {
    func numberOfItems() -> Int {
        return 2
    }
    
    func controller(at index: Int) -> UIViewController {
        return subcontrollers[index]
    }
    
    func button(at index: Int) -> UIButton {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = AppFont.createFont(type: .bold)
        return button
    }
    
    func colorForIndicator(at index: Int) -> UIColor {
        return AppColors.dark
    }
    
    func heightForIndicator() -> CGFloat {
        return 3
    }
    
    func shouldShowSeparator() -> Bool {
        return true
    }
    
    func cornerRadiusForIndicator() -> CGFloat {
        return 1.5
    }
}
