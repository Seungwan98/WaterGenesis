//
//  ViewController.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/18/24.
//

import UIKit
import Then
import SnapKit
class MyPageVC: UIViewController {
    
    let treesSize : [CGSize] = [CGSize( width: 41, height: 131), CGSize(width: 98, height: 100), CGSize( width: 76, height: 140), CGSize(width: 110, height: 120), CGSize( width: 180, height: 160)]
    
    let treeImageView = UIImageView()
    
    let pickTrees = 4
    
    lazy var mainStack = UIStackView(arrangedSubviews: [iconStack, labelStack]).then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 12
        
    }
    let iconStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.spacing = 70

    }
    let labelStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center


    }
    
    

    let profileShadow = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
   
    }
    
    let settingBtn = UIButton().then {
        $0.setImage(UIImage(named: "setting"), for: .normal)
        
    }
    
    let bottomShadow = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
   
    }
    
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "face")
        $0.contentMode = .scaleAspectFit
    }
    
    let nameLabel = UILabel().then {
        
        $0.text = "노혜인"
        $0.font = WDFont.bold(size: 24)
    }
    let emailLabel = UILabel().then {
        
        $0.text = "ssss@naver.com"
        $0.font = WDFont.regular(size: 16)
        $0.textColor = .lightGray
    }
    
    
    let treeInform = UILabel().then {
        $0.text = "홍길동님이\n심은 소나무 100그루"
        $0.font = WDFont.bold(size: 26)
    
        $0.numberOfLines = 0
    }
    
    let environmentInform = UILabel().then {
        $0.text = "당신이 환경에 기여한 효과는?"
        $0.font = WDFont.bold(size: 16)
        $0.textColor = maincolor
    }
    
    
    let leaves = UIImageView(image: UIImage(named: "leaves"))
    
    let stroke = Stroke()
    
    let killoLabel = UILabel().then {
        $0.font = WDFont.bold(size: 14)
        $0.text = "온실가스 40kg 절감"
    }
    let countTreelabel = UILabel().then {
        $0.font = WDFont.bold(size: 14)
        $0.text = "소나무 40 그루 심은 효과"

    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setTopView()
        setStackViews()
        setBottomView()
    }
    
    let images = [UIImageView(image: UIImage(named: "megaphone")), UIImageView(image: UIImage(named: "FAQ")), UIImageView(image: UIImage(named: "phone"))]
    let labelsTexts = ["공지사항", "F A Q", "전화 문의"]
    let sizes = [CGSize(width: getWidth(width: 38), height: getHeight(height: 38)), CGSize(width: getWidth(width: 42), height:  getHeight(height: 42)), CGSize(width: getWidth(width: 42), height: getHeight(height: 38))]
    
    func setStackViews() {
        self.profileShadow.addSubview(self.mainStack)

       _ = images.enumerated().map { count, image in
           
           
           iconStack.addArrangedSubview(image)
           
           let label = UILabel()
           label.text = labelsTexts[count]
           label.font = WDFont.regular(size: 16)
        
           labelStack.addArrangedSubview(label)
           
           image.snp.makeConstraints {
               $0.height.width.equalTo(sizes[count])
               $0.centerX.equalTo(label)
           }
        }
        
        
        
        mainStack.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            
        }
        
        
        
        
    
        
        
    }
    
    func setTopView() {
        self.view.addSubview(self.profileShadow)
        self.profileShadow.addSubview(self.profileImage)
        self.profileShadow.addSubview(self.nameLabel)
        self.profileShadow.addSubview(self.emailLabel)
        self.profileShadow.addSubview(self.settingBtn)
        
        treeImageView.image = UIImage(named: "trees_\(pickTrees)")
        
        profileShadow.snp.makeConstraints {
            
            $0.height.equalTo(getWidth(width: 240))
            $0.width.equalTo(getWidth(width: 328))
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
        profileImage.snp.makeConstraints {
            
            $0.height.width.equalTo(getWidth(width: 98))
            $0.leading.equalToSuperview().inset(getWidth(width: 18))
            $0.top.equalToSuperview().inset(getHeight(height: 18))
        }
        
        nameLabel.snp.makeConstraints {
            
           
            $0.leading.equalTo(profileImage.snp.trailing).offset(16)
            $0.centerY.equalTo(profileImage).offset(-4)
        }
        
        emailLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(0)
            
        }
        settingBtn.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().offset(20)
            $0.width.height.equalTo(28)
            
        }
    }
    
    
    func setBottomView() {
        self.view.addSubview(bottomShadow)
        self.bottomShadow.addSubview(treeInform)
        self.bottomShadow.addSubview(leaves)
        self.bottomShadow.addSubview(environmentInform)
        self.bottomShadow.addSubview(stroke)
        self.bottomShadow.addSubview(treeImageView)
        self.bottomShadow.addSubview(killoLabel)
        self.bottomShadow.addSubview(countTreelabel)
        
        bottomShadow.snp.makeConstraints {
            $0.leading.trailing.equalTo(profileShadow)
            $0.top.equalTo(profileShadow.snp.bottom).offset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        treeInform.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(22)
            $0.top.equalToSuperview().inset(32)
        }
        leaves.snp.makeConstraints {
            $0.width.equalTo(getWidth(width: 12))
            $0.height.equalTo(getWidth(width: 22))
            $0.top.equalTo(treeInform.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(24)
        }
        environmentInform.snp.makeConstraints {
            $0.leading.equalTo(leaves).inset(22)
            $0.centerY.equalTo(leaves)
        }
        stroke.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(environmentInform.snp.bottom).offset(14)
            
        }
        treeImageView.snp.makeConstraints {
            $0.width.height.equalTo(self.treesSize[pickTrees])
            $0.trailing.bottom.equalToSuperview().inset(10)
        }
        killoLabel.snp.makeConstraints {
            $0.leading.equalTo(leaves)
            $0.top.equalTo(stroke.snp.bottom).offset(10)

        }
        countTreelabel.snp.makeConstraints {
            $0.leading.equalTo(leaves)
            $0.top.equalTo(killoLabel.snp.bottom).offset(10)

        }
        
        
    }
  
    
    
      
    
    
}
