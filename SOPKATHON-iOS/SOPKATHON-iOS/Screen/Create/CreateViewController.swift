import UIKit
import SnapKit
import Then

// MARK: - CreateViewController

final class CreateViewController: UIViewController {
    let btnList : [BtnList] = BtnList.titleList
    // MARK: - UI Components
    enum Section : Int, CaseIterable, Hashable {
        case main
    }
    var dataSource : UICollectionViewDiffableDataSource<Section,AnyHashable>! = nil
    private lazy var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createlayout()).then {
        $0.register(CreateBtnCell.self, forCellWithReuseIdentifier: CreateBtnCell.reuserId)
    }
    private let mainLabel = UILabel().then {
        $0.text = "관계 추가"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 18, weight: .medium)
    }
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"ic_back"), for: .normal)
        button.addTarget(self, action: #selector(touchupBackButton), for:.touchUpInside)
        return button
    }()
    
    private let nameLabel = UILabel().then {
        $0.text = "이름"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    private let nameTextField = UITextField().then {
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = UIColor.gray1
        $0.placeholder = "이름을 입력하세요"
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 14.0, height: 0.0))
        $0.leftViewMode = .always
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray2.cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let birthLabel = UILabel().then {
        $0.text = "생일"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    private let birthTextField = UITextField().then {
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = UIColor.gray1
        $0.placeholder = "생일을 입력하세요"
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 14.0, height: 0.0))
        $0.leftViewMode = .always
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray2.cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let mbtiLabel = UILabel().then {
        $0.text = "MBTI"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    private let mbtiTextField = UITextField().then {
        $0.backgroundColor = .white
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = UIColor.gray1
        $0.placeholder = "MBTI를 입력하세요"
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 14.0, height: 0.0))
        $0.leftViewMode = .always
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray2.cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let memoLabel = UILabel().then {
        $0.text = "메모"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
//    private let memoCharLabel = UILabel().then {
//        $0.text = "(200자)"
//        $0.textColor = UIColor.black
//        $0.font = .systemFont(ofSize: 12, weight: .regular)
//    }
    
    private let memoTextView = UITextView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray2.cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let colorLabel = UILabel().then {
        $0.text = "친밀도"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }

    private let imgLabel = UILabel().then {
        $0.text = "사진"
        $0.textColor = UIColor.black
        $0.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    private lazy var selectImgButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"select_img"), for: .normal)
        button.addTarget(self, action: #selector(touchupselectImgButton), for:.touchUpInside)
        return button
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"add_button"), for: .normal)
        // button.addTarget(self, action: #selector(touchupaddButton), for:.touchUpInside)
        return button
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        layout()
        setupDataSource()
        reloadData()
    }
    
    @objc
    private func touchupBackButton() {
        self.dismiss(animated:true, completion:nil)
    }

    @objc
    private func touchupselectImgButton() {
        selectImgButton.setImage(UIImage(named: "selected_img"), for: .normal)
    }
}

extension CreateViewController {
    private func layout() {
      
        [mainLabel, backButton, nameLabel, nameTextField, birthLabel, birthTextField, mbtiLabel, mbtiTextField, memoLabel,memoTextView, colorLabel,collectionView, imgLabel, selectImgButton, addButton].forEach {
            view.addSubview($0)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(74)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(64)
            $0.leading.equalToSuperview().offset(18)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.backButton.snp.bottom).offset(22)
            $0.leading.equalTo(self.backButton.snp.leading)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }
        
        birthLabel.snp.makeConstraints {
            $0.top.equalTo(self.nameTextField.snp.bottom).offset(20)
            $0.leading.equalTo(self.nameLabel.snp.leading)
        }
        
        birthTextField.snp.makeConstraints {
            $0.top.equalTo(self.birthLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(44)
        }
        
        mbtiLabel.snp.makeConstraints {
            $0.top.equalTo(self.birthTextField.snp.bottom).offset(20)
            $0.leading.equalTo(self.nameLabel.snp.leading)
        }
        
        mbtiTextField.snp.makeConstraints {
            $0.top.equalTo(self.mbtiLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(44)
        }
        
        memoLabel.snp.makeConstraints {
            $0.top.equalTo(self.mbtiTextField.snp.bottom).offset(20)
            $0.leading.equalTo(self.nameLabel.snp.leading)
        }
        
        memoTextView.snp.makeConstraints {
            $0.top.equalTo(self.memoLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(100)
        }
        
        colorLabel.snp.makeConstraints {
            $0.top.equalTo(self.memoTextView.snp.bottom).offset(20)
            $0.leading.equalTo(self.nameLabel.snp.leading)
        }
       
        collectionView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.top.equalTo(colorLabel.snp.bottom)
            $0.height.equalTo(70)
        }
        imgLabel.snp.makeConstraints {
            $0.top.equalTo(self.collectionView.snp.bottom).offset(20)
            $0.leading.equalTo(self.nameLabel.snp.leading)
        }
        
        selectImgButton.snp.makeConstraints {
            $0.top.equalTo(self.imgLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.nameLabel.snp.leading)
            $0.width.equalTo(84)
            $0.height.equalTo(84)
        }
        
        addButton.snp.makeConstraints {
            $0.top.equalTo(self.selectImgButton.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(18)
        }
    }
}
extension CreateViewController {
    func setupDataSource(){
       dataSource = UICollectionViewDiffableDataSource<Section,AnyHashable>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) in
           guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CreateBtnCell.reuserId,for : indexPath) as? CreateBtnCell else {return UICollectionViewCell()}
                    cell.config(item as! BtnList)
               return cell
       })
   }
    func createlayout() -> UICollectionViewCompositionalLayout{
       let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(70))
       let item = NSCollectionLayoutItem(layoutSize: itemSize)
       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(70))
       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
       let section = NSCollectionLayoutSection(group: group)
       return UICollectionViewCompositionalLayout(section: section)
   }
   private func reloadData(){
       var snapShot = NSDiffableDataSourceSnapshot<Section,AnyHashable>()
       defer{
           dataSource.apply(snapShot,animatingDifferences: false)
       }
       snapShot.appendSections([.main])
       snapShot.appendItems(btnList,toSection: .main)
   }
}
extension CreateViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
