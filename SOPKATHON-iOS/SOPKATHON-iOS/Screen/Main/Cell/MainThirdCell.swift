//
//  MainThirdCell.swift
//  SOPKATHON-iOS
//
//  Created by JEONGEUN KIM on 2022/11/20.
//

import UIKit

class MainThirdCell: UICollectionViewCell {
    static let reuseId : String = "MainThirdCell"
    private lazy var image = UIImageView().then {
        $0.image = UIImage(named: "Main/SectionCell/third")
    }
    private lazy var userId = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Medium", size: 12)
    }
    func config(_ item :PersonId3){
        userId.text = item.name
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setViews(){
        self.addSubview(image)
        image.addSubview(userId)
    }
   private func setConstraints(){
        image.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
       userId.snp.makeConstraints {
           $0.leading.equalTo(image.snp.leading).offset(18)
           $0.bottom.equalTo(image.snp.bottom).offset(-27)
       }
    }
}
