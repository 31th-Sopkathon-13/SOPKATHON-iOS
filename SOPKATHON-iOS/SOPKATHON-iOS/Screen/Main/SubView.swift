//
//  SubView.swift
//  SOPKATHON-iOS
//
//  Created by JEONGEUN KIM on 2022/11/20.
//


import UIKit
import Then
import SnapKit

class SubView: UIView {
    private lazy  var titleLabel = UILabel().then  {
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.text = "Re ; code"
        $0.font = UIFont(name: "Termina-Demi", size: 21.69)
    }
     lazy var btn = UIButton().then {
        $0.setImage(UIImage(named: "Main/_Btn"), for: .normal)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        setViews()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews(){
        self.addSubview(titleLabel)
        self.addSubview(btn)
    }
    func  setConstraints(){
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(self).offset(18)
            $0.centerY.equalToSuperview()
        }
        btn.snp.makeConstraints {
            $0.width.height.equalTo(44)
            $0.trailing.equalToSuperview().offset(-18)
            $0.centerY.equalToSuperview()
        }
    }
}
