//
//  RTLCollectionViewLayout.swift
//  SOPKATHON-iOS
//
//  Created by JEONGEUN KIM on 2022/11/20.
//

import UIKit

class RTLCollectionViewLayout: UICollectionViewCompositionalLayout {
    
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return false
    }
    
    override var developmentLayoutDirection: UIUserInterfaceLayoutDirection {
        return .rightToLeft
    }
}
