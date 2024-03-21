//
//  Section.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 21.03.2024.
//

import UIKit

struct Section {
    var title: String
    var isOpened: Bool = false
    var options: [String]
    
    init(title: String, options: [String], isOpened: Bool = false) {
        self.title = title
        self.isOpened = isOpened
        self.options = options
    }
}
