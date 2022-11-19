//
//  DetailViewController.swift
//  SOPKATHON-iOS
//
//  Created by 황찬미 on 2022/11/19.
//

import UIKit

import SnapKit
import Then

final class DetailViewController: UIViewController {
    
    let imegaview = UIImageView().then {
        $0.image = UIImage(named: "lpDetail")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imegaview)
        
        imegaview.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(popView))
        view.addGestureRecognizer(gesture)
    }
    
    @objc
    private func popView() {
        navigationController?.popViewController(animated: true)
    }
}
