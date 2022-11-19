//
//  UIFont+.swift
//  SOPKATHON-iOS
//
//  Created by 황찬미 on 2022/11/20.
//

import UIKit

enum FontName: String {
    case hi
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
