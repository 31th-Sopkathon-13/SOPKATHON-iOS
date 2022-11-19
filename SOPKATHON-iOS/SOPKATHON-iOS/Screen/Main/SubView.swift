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
    private lazy  var titleImage = UIImageView().then  {
        $0.image = UIImage(named: "Main/logo")
    }
    lazy var btn = UIButton().then {
        $0.setImage(UIImage(named: "Main/_Btn"), for: .normal)
        $0.addTarget(self, action: #selector(btnTapped),for: .touchUpInside)
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
        self.addSubview(titleImage)
        self.addSubview(btn)
    }
    func  setConstraints(){
        titleImage.snp.makeConstraints {
            $0.leading.equalTo(self).offset(18)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(110)
            $0.height.equalTo(26)
        }
        btn.snp.makeConstraints {
            $0.width.height.equalTo(44)
            $0.trailing.equalToSuperview().offset(-18)
            $0.centerY.equalToSuperview()
        }
    }
    @objc func btnTapped(){
        print("tapped")
    }
}
