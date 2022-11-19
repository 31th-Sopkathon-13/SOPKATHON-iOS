//
//  OnboardingViewController.swift
//  SOPKATHON-iOS
//
//  Created by 정윤선 on 2022/11/20.
//

import UIKit

import SnapKit

// MARK: - OnboardingViewController

class OnboardingViewController: UIViewController {

    // MARK: - UI Components
    
    private let recordRelationsLabel: UILabel = {
        let label = UILabel()
        label.text = "소중한 관계를 기록해보세요"
        label.textColor = .black
        label.font = .Pretendard(.bold, size: 20)
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력하세요"
        textField.font = .Pretendard(.regular, size: 18)
        textField.textAlignment = .center
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private let enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("입장하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .Pretendard(.bold, size: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 28
        return button
    }()
    
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
    }

}


// MARK: - Extensions

extension OnboardingViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        [recordRelationsLabel, nameTextField, enterButton].forEach {
            view.addSubview($0)
        }
        
        recordRelationsLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(114)
            $0.height.equalTo(31)
        }
        
        nameTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(18)
            $0.top.equalTo(self.recordRelationsLabel.snp.bottom).offset(118)
            $0.height.equalTo(60)
        }
        
        enterButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(18)
            $0.top.equalTo(self.nameTextField.snp.bottom).offset(14)
            $0.height.equalTo(56)
        }
    }
}
