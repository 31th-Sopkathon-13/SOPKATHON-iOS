//
//  MainViewController.swift
//  SOPKATHON-iOS
//
//  Created by 황찬미 on 2022/11/19.
//

import UIKit
import Then
import SnapKit

final class MainViewController: UIViewController {
    let s1_Name : [PersonId1] = PersonId1.idList
    let s2_Name : [PersonId2] = PersonId2.idList
    let s3_Name : [PersonId3] = PersonId3.idList
    typealias Item = AnyHashable
    enum Sections : Int, CaseIterable,Hashable{
        case first, second, third
    }
    var dataSource : UICollectionViewDiffableDataSource<Sections,Item>! = nil
    private lazy var subView = SubView(frame: self.view.bounds).then{
        $0.backgroundColor = .clear
        $0.rootVC = self
    }
    
    func presentToCreate() {
        let createVC = CreateViewController()
        createVC.modalPresentationStyle = .overFullScreen
        self.present(createVC, animated: true)
    }
    private lazy var backgroungView = UIImageView().then {
        $0.image = UIImage(named: "Main/Background")
    }
    private lazy var imageView = MainImageView(frame: self.view.bounds).then {
        $0.backgroundColor = .clear
    }
    private lazy var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout()).then {
        $0.backgroundColor = .clear
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.delegate = self
    }
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        setViews()
        setConstraints()
        registerSubViews()
        setupDataSource()
        reloadData()
        self.navigationController?.isNavigationBarHidden = true
    }
    func registerSubViews(){
        collectionView.register(MainFirstCell.self, forCellWithReuseIdentifier: MainFirstCell.reuseId)
        collectionView.register(MainSecondCell.self, forCellWithReuseIdentifier: MainSecondCell.reuseId)
        collectionView.register(MainThirdCell.self, forCellWithReuseIdentifier: MainThirdCell.reuseId)
    }
    func setViews(){
        view.addSubview(backgroungView)
        view.addSubview(subView)
        view.addSubview(collectionView)
        view.addSubview(imageView)
    }
    func setConstraints(){
        backgroungView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        subView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.top.equalToSuperview().offset(81)
            $0.height.equalTo(44)
        }
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalTo(subView.snp.bottom).offset(46)
            $0.height.equalTo(418)

        }
        collectionView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(-54)
            $0.trailing.equalToSuperview()
            $0.top.equalTo(imageView.snp.top)
            $0.bottom.equalTo(imageView.snp.bottom)
        }
    }
    func setupDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Sections,Item>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let section = Sections(rawValue: indexPath.section)!
            switch section{
            case .first:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainFirstCell.reuseId, for: indexPath) as! MainFirstCell
                cell.config(item as! PersonId1)
                return cell
            case .second:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainSecondCell.reuseId, for: indexPath) as! MainSecondCell
                cell.config(item as! PersonId2)
                return cell
            case .third:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainThirdCell.reuseId, for: indexPath) as! MainThirdCell
                cell.config(item as! PersonId3)
                return cell
            }
        })
    }
    private func reloadData(){
        var snapshot = NSDiffableDataSourceSnapshot<Sections,Item>()
        defer {
            dataSource.apply(snapshot, animatingDifferences: false)
        }
        snapshot.appendSections([.first,.second,.third])
        snapshot.appendItems(s1_Name,toSection: .first)
        snapshot.appendItems(s2_Name,toSection: .second)
        snapshot.appendItems(s3_Name,toSection: .third)
    }
    func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvirnment) -> NSCollectionLayoutSection? in
            let section = Sections(rawValue: sectionIndex)!
            switch section {
            case .first,.second,.third:
                return self.normalSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 47
        layout.configuration = config
        return layout
        }
    func normalSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(108), heightDimension: .absolute(108))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(226),heightDimension: .estimated(108))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let spacing = CGFloat(10)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading:64, bottom: 0, trailing: 0)
       return section
   }
    
    
    private func pushToDetail() {
        let detailVC = DetailViewController()
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
extension MainViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        pushToDetail()
    }
    
    
}
