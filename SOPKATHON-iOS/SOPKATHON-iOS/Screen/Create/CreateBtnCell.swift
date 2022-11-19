//
//  CreateBtnCell.swift
//  SOPKATHON-iOS
//
//  Created by 김민서 on 2022/11/20.
//

import UIKit
import Then
import SnapKit

class CreateBtnCell: UICollectionViewCell {
    static let reuserId : String = "CreateBtnCell"
    private lazy var vStack = UIStackView(arrangedSubviews: [btnImage,btnTitle]).then{
        $0.axis = .vertical
        $0.spacing = 5
    }
    override var isSelected: Bool {
        didSet{
            self.btnImage.image = isSelected ? UIImage(named: "radio_clicked") : UIImage(named: "radio_unclicked")
        }
    }
    private lazy var btnImage = UIImageView().then{
        $0.image = UIImage(named: "radio_unclicked")
    }
    private lazy var btnTitle = UILabel().then {
        $0.text = "상"
        $0.textAlignment = .center
    }

    func config(_ item : BtnList){
        btnTitle.text = item.title
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
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(40)
            $0.top.bottom.equalToSuperview()
        }
        btnImage.snp.makeConstraints {
            $0.width.height.equalTo(40)
        }
        btnTitle.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview()
        }
    }
    
}
