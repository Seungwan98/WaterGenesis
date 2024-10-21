//
//  ViewController.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/18/24.
//

import UIKit
import Then
import SnapKit
class MainVC: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let face = UIImageView(image: UIImage(named: "face")).then {
        $0.contentMode = .scaleAspectFill
    }
    let welcome = UILabel().then {
        $0.text = "안녕하세요, 노혜인님!"
        $0.numberOfLines = 0
        $0.font = .boldSystemFont(ofSize: 22)
    }
    let pointInform = UILabel().then {
        $0.text = "노혜인님의 탄소 포인트"
        $0.font = .boldSystemFont(ofSize: 22)
    }

    let topView = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    let middleView = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20

    } 
    
    let leaves = UIImageView(image: UIImage(named: "leaves"))
    
    let bottomView = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20

    }
    let guide = UILabel().then {
        $0.text = "사용법"
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    
    func setUI() {

        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.addSubview(self.topView)
        self.topView.addSubview(self.face)
        self.topView.addSubview(self.welcome)

        
        self.contentView.addSubview(self.middleView)
        self.middleView.addSubview(self.pointInform)
        self.middleView.addSubview(self.leaves)
        
        self.contentView.addSubview(self.bottomView)
        self.contentView.addSubview(self.guide)
        
        scrollView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.width.equalToSuperview()
            $0.height.equalTo(getHeight(height: 776))
        }
     
        
        topView.snp.makeConstraints {
            $0.width.equalTo(getWidth(width: 326))
            $0.height.equalTo(getHeight(height: 109))
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(getHeight(height: 36))
        }
        face.snp.makeConstraints {
            $0.width.equalTo(getWidth(width: 82))
            $0.height.equalTo(getHeight(height: 82))
            $0.top.equalToSuperview().inset(getHeight(height: 11))
            $0.leading.equalToSuperview().inset(getHeight(height: 29))
        }
        welcome.snp.makeConstraints {
            $0.width.equalTo(getWidth(width: 156))
            $0.height.equalTo(getHeight(height: 64))
            $0.leading.equalTo(face.snp.trailing).offset(getWidth(width: 29))
            $0.centerY.equalTo(face)
        }
        
        
        
        middleView.snp.makeConstraints {
            $0.width.equalTo(getWidth(width: 324))
            $0.height.equalTo(getHeight(height: 166))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(topView.snp.bottom).offset(getHeight(height: 32))

        }
        pointInform.snp.makeConstraints {
            $0.top.equalToSuperview().inset(getHeight(height: 26))
            $0.centerX.equalToSuperview()
        }
        leaves.snp.makeConstraints {
            $0.leading.equalTo(getWidth(width: 98))
            $0.centerY.equalToSuperview()
            $0.width.equalTo(getWidth(width: 18.67))
            $0.height.equalTo(getHeight(height: 33.7))
        }
        
        guide.snp.makeConstraints {
            $0.bottom.equalTo(bottomView.snp.top).offset(getHeight(height: -7))
            $0.centerX.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints {
            $0.width.equalTo(getWidth(width: 282))
            $0.height.equalTo(getHeight(height: 220))
            $0.centerX.equalToSuperview()
            $0.top.equalTo(middleView.snp.bottom).offset(getHeight(height: 65))

        }
        
        
        




        


    }

}
