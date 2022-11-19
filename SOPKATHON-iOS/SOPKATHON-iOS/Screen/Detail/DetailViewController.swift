//
//  DetailViewController.swift
//  SOPKATHON-iOS
//
//  Created by 황찬미 on 2022/11/19.
//

import UIKit

import SnapKit

// MARK: - DetailViewController

final class DetailViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.8)
        view.layer.cornerRadius = 5
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 10
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Seyeon"
        label.textColor = .primary
        /*
        label.font = .Pretendard(.bold, size: 20)
        */
        return label
    }()
    
    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "생일"
        label.textColor = .gray1
        /*
        label.font = .Pretendard(.bold, size: 14)
        */
        return label
    }()
    
    private let birthdayDataLabel: UILabel = {
        let label = UILabel()
        label.text = "2001.02.16"
        label.textColor = .gray1
        /*
        label.font = .Pretendard(.bold, size: 14)
        */
        return label
    }()
    
    private let mbtiLabel: UILabel = {
        let label = UILabel()
        label.text = "MBTI"
        label.textColor = .gray1
        /*
        label.font = .Pretendard(.bold, size: 14)
        */
        return label
    }()
    
    private let mbtiDataLabel: UILabel = {
        let label = UILabel()
        label.text = "ISTP"
        label.textColor = .gray1
        /*
        label.font = .Pretendard(.bold, size: 14)
        */
        return label
    }()
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
    }
}


// MARK: - Extensions

extension DetailViewController {
    private func layout() {
        [detailView].forEach {
            view.addSubview($0)
        }
        
        [nameLabel, birthdayLabel, birthdayDataLabel, mbtiLabel, mbtiDataLabel].forEach {
            detailView.addSubview($0)
        }
        
        detailView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(18)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(56)
            $0.height.equalTo(244)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.detailView.snp.top).offset(24)
            $0.leading.equalTo(self.detailView.snp.leading).offset(44)
            $0.width.equalTo(70)
            $0.height.equalTo(24)
        }
        
        birthdayLabel.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(38)
            $0.leading.equalTo(self.nameLabel)
            $0.width.equalTo(30)
            $0.height.equalTo(17)
        }
        
        birthdayDataLabel.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(38)
            $0.leading.equalTo(self.birthdayLabel.snp.trailing).offset(25)
            $0.width.equalTo(85)
            $0.height.equalTo(17)
        }
        
        mbtiLabel.snp.makeConstraints {
            $0.top.equalTo(self.birthdayLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.nameLabel)
            $0.width.equalTo(40)
            $0.height.equalTo(17)
        }
        
        mbtiDataLabel.snp.makeConstraints {
            $0.top.equalTo(self.birthdayLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.mbtiLabel.snp.trailing).offset(15)
            $0.width.equalTo(40)
            $0.height.equalTo(17)
        }
    }
}
