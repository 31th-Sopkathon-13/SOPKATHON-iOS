//
//  MainImageView .swift
//  SOPKATHON-iOS
//
//  Created by JEONGEUN KIM on 2022/11/20.
//

import UIKit
import Then
import SnapKit

class MainImageView : UIView {
    private lazy var vStack = UIStackView(arrangedSubviews: [firstSection,secondSection,thirdSection]).then {
        $0.axis = .vertical
        $0.spacing = 47
    }
    private lazy var firstSection = UIImageView().then {
        $0.image = UIImage(named: "Main/FirstSection")
    }
    private lazy var secondSection = UIImageView().then {
        $0.image = UIImage(named: "Main/SecondSection")
    }
    private lazy var thirdSection = UIImageView().then {
        $0.image = UIImage(named: "Main/ThirdSection")
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setViews(){
        self.addSubview(vStack)
    }
    func setConstraints(){
        vStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        firstSection.snp.makeConstraints {
            $0.width.equalTo(162)
            $0.height.equalTo(108)
        }
        secondSection.snp.makeConstraints {
            $0.width.equalTo(162)
            $0.height.equalTo(108)
        }
        thirdSection.snp.makeConstraints {
            $0.width.equalTo(162)
            $0.height.equalTo(108)
        }
    }
}
