////
////  PointVC.swift
////  WaterGenesis
////
////  Created by 이노프렌즈 on 10/21/24.
////
//
//import UIKit
//
//import Then
//import SnapKit
//
//class PointVC : UIViewController {
//    let informlabel = UILabel().then {
//        $0.text = "노혜인님의 \n 일회용 컵 절감 215개"
//        $0.font = WDFont.bold(size: 26)
//    }
//    let middleView = ShadowView()
//    
//    let
//        
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setUI()
//        
//    }
//    
//    func setUI() {
//        
//        informlabel.snp.makeConstraints {
//            $0.height.equalTo(getHeight(height: 80))
//            $0.width.equalTo(getWidth(width: 231))
//            $0.top.equalToSuperview().inset(10)
//        }
//        
//        middleView.snp.makeConstraints {
//            $0.width.equalTo(getWidth(width: 328))
//            $0.height.equalTo(getHeight(height: 92))
//        }
//    }
//    
//}
