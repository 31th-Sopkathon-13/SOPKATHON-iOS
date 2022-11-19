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
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg_lp_detail")
        return imageView
    }()
    
    private let navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"ic_back"), for: .normal)
        button.addTarget(self, action: #selector(touchupBackButton), for:.touchUpInside)
        return button
    }()
    
    private let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_menu"), for: .normal)
        button.addTarget(self, action: #selector(touchupMenuButton), for:.touchUpInside)
        return button
    }()
    
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
    
    private let memoLabel: UILabel = {
        let label = UILabel()
        label.text = "메모"
        label.textColor = .gray1
        /*
        label.font = .Pretendard(.bold, size: 14)
        */
        return label
    }()
    
    private let memoDataLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.text = "디자인 천재 세연이 S2\n턴테이블로 LP 노래 듣고\n필름카메라로 사진 찍는 것을 좋아함"
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
    
    private func pushToDetailDropdownVC() {
        let detailDropDownVC = DetailDropdownViewController()
        self.navigationController?.pushViewController (detailDropDownVC, animated: true)
    }
    
    @objc
    private func touchupMenuButton() {
        pushToDetailDropdownVC()
    }
    
    @objc
    private func touchupBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}


// MARK: - Extensions

extension DetailViewController {
    private func layout() {
        [backgroundImageView,navigationView, detailView].forEach {
            view.addSubview($0)
        }
        
        [backButton, menuButton].forEach {
            navigationView.addSubview($0)
        }
        
        [nameLabel, birthdayLabel, birthdayDataLabel, mbtiLabel, mbtiDataLabel, memoLabel, memoDataLabel].forEach {
            detailView.addSubview($0)
        }
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        navigationView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(75)
            $0.height.equalTo(44)
        }
        
        backButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.navigationView.snp.leading).offset(23)
            $0.width.equalTo(44)
        }
        
        menuButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalTo(self.navigationView.snp.trailing).inset(23)
            $0.width.equalTo(44)
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
        }
        
        birthdayLabel.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(38)
            $0.leading.equalTo(self.nameLabel)
        }
        
        birthdayDataLabel.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(38)
            $0.leading.equalTo(self.birthdayLabel.snp.trailing).offset(23)
        }
        
        mbtiLabel.snp.makeConstraints {
            $0.top.equalTo(self.birthdayLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.nameLabel)
        }
        
        mbtiDataLabel.snp.makeConstraints {
            $0.top.equalTo(self.birthdayLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.mbtiLabel.snp.trailing).offset(15)
        }
        
        memoLabel.snp.makeConstraints {
            $0.top.equalTo(self.mbtiLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.nameLabel)
        }
        
        memoDataLabel.snp.makeConstraints {
            $0.top.equalTo(self.mbtiLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.memoLabel.snp.trailing).offset(24)
        }
    }
}
