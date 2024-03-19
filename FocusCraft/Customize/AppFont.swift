//
//  AppFont.swift
//  FocusCraft
//
//  Created by Алибек Аблайулы on 19.03.2024.
//

import UIKit

enum FontType {
    case regular
    case medium
    case bold
}

struct AppFont {
    static func createFont(type with: FontType, size: CGFloat = 14) -> UIFont {
        switch with {
        case .regular:
            return UIFont(name: "OpenSans-Regular", size: size)!
        case .medium:
            return UIFont(name: "OpenSans-Medium", size: size)!
        case .bold:
            return UIFont(name: "OpenSans-Bold", size: size)!
        }
    }
}
