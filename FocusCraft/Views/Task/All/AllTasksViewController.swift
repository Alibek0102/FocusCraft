//
//  AllTasksViewController.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 21.03.2024.
//

import UIKit

class AllTasksViewController: UITableViewController {
    
    let tasksHeaderId: String = "tasksHeaderId"
    let tasksItemsId: String = "tasksItemsId"
    
    var sections: [Section] = [
        Section(title: "Today", options: ["hellow", "world"]),
        Section(title: "Future", options: ["hellow", "world"]),
        Section(title: "Completed Today", options: ["hellow", "world"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = AppColors.pageGray
        tableView.register(HeaderCell.self, forCellReuseIdentifier: tasksHeaderId)
        tableView.register(TaskItemCell.self, forCellReuseIdentifier: tasksItemsId)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row != 0 {
            return 65
        }
        
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = self.sections[section]
        
        if currentSection.isOpened {
            return currentSection.options.count + 1
        }
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: tasksHeaderId, for: indexPath) as? HeaderCell {
                let currentSection = sections[indexPath.section]
                cell.sectionLabel.text = currentSection.title
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: tasksItemsId, for: indexPath) as? TaskItemCell {
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
    
    }
}
