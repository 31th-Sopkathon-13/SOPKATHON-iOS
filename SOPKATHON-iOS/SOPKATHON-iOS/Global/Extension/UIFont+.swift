//
//  UIFont+.swift
//  SOPKATHON-iOS
//
//  Created by 황찬미 on 2022/11/20.
//

import UIKit

extension UIFont {
    // MARK: - Pretendard
    
    public enum PretendardType: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"
        case semiBold = "SemiBold"
    }
    
    static func Pretendard(_ type: PretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
    
//    class var h0: UIFont {
//      return UIFont(name: "Pretendard-Bold", size: 24.0)!
//    }
}
