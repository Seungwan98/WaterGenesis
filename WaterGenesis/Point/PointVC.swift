//
//  PointVC.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/21/24.
//

import UIKit
import Foundation
import Then
import SnapKit


protocol PointView: AnyObject {
    
}

class PointVC: UIViewController, PointView {
    
    
    var presenter: PointPresenter?
    
    let manImage = UIImageView().then {
        $0.image = UIImage(named: "manCharactor.png")
    }
    
    let pointIcon = UIImageView().then {
        $0.image =  UIImage(named: "pointIcon")?.withRenderingMode(.alwaysTemplate)
        
        $0.tintColor = maincolor
        $0.contentMode = .scaleAspectFit
    }
    
    let pointInform = UILabel().then {
        $0.text = "포인트 상세 내역"
        $0.font = WDFont.medium(size: 22)
    }
    
    let informlabel = UILabel().then {
        $0.text = "노혜인님의\n일회용 컵 절감 215개"
        $0.font = WDFont.bold(size: 28)
        $0.numberOfLines = 0
    }
    
    let middleView = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    
    let leftCal = UIView()
    let rightCal = UIView()
    
    lazy var calStack = UIStackView(arrangedSubviews: [leftCal, rightCal]).then {
        $0.spacing = 20
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    let search = ColorButton().then {
        $0.setTitle(text: "검색")
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = WDFont.bold(size: 20)
    }

    let calendarView = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 18
        
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setBottomView()
        setCalendarView()

    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.topItem?.title = "포인트"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: WDFont.bold(size: 18)]
        

        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
    }
    func setUI() {
        
        
        self.view.addSubview(middleView)
        self.view.addSubview(informlabel)
        self.view.addSubview(manImage)
        self.view.addSubview(pointIcon)
        self.view.addSubview(pointInform)

//        
//        
//        self.view.addSubview(self.scrollView)
//        self.scrollView.addSubview(self.contentView)
       

        middleView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(getHeight(height: 100))
            $0.top.equalTo(self.informlabel.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
        }
        informlabel.snp.makeConstraints {
            $0.height.equalTo(getHeight(height: 80))
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(20)
        }
        
        manImage.snp.makeConstraints {
            $0.width.equalTo(getHeight(height: 113.21))
            $0.height.equalTo(getHeight(height: 119))
            $0.trailing.equalTo(informlabel)
            $0.bottom.equalTo(middleView.snp.top).offset(4)
        }
        pointIcon.snp.makeConstraints {
            $0.height.equalTo(getHeight(height: 30))
            $0.width.equalTo(getHeight(height: 28))
            $0.leading.equalToSuperview().inset(22)
            $0.top.equalTo(middleView.snp.bottom).offset(40)
        }
        pointInform.snp.makeConstraints {
            $0.centerY.equalTo(pointIcon)
            $0.leading.equalTo(pointIcon.snp.trailing).offset(8)
        }
     
        
        
    }
    
    func setBottomView() {
        self.view.addSubview(calStack)
        self.view.addSubview(search)
    
        

        _ = calStack.arrangedSubviews.enumerated().map { count, stack in
            let gesture = UITapGestureRecognizer()
            gesture.addTarget(self, action: #selector(calendarTapped))

            stack.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
            stack.layer.cornerRadius = 10
            stack.tag = count
            stack.isUserInteractionEnabled = true
            
            stack.addGestureRecognizer(gesture)
            
            
            
            let image = UIImageView(image: UIImage(named: "calendar"))
            let transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            image.transform = transform
            
            stack.addSubview(image)
            image.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview()
                
            }
        }
        
        
        
        calStack.snp.makeConstraints {
            $0.top.equalTo(pointInform.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(50)
            
            
        }
        
        search.snp.makeConstraints {
            $0.leading.trailing.equalTo(calStack)
            $0.height.equalTo(50)
            $0.top.equalTo(calStack.snp.bottom).offset(20)
        }
    }
    
    func setCalendarView() {
        self.view.addSubview(calendarView)
        let calendar = CalendarView(delegate: self)
        
        calendarView.addSubview(calendar)
        
        calendar.snp.makeConstraints {
            $0.width.height.equalToSuperview()
        }
        
        calendarView.snp.makeConstraints {
            $0.leading.equalTo(calStack)
            $0.top.equalTo(calStack.snp.bottom)
            $0.width.height.equalTo(300)
        }
     
    }
    
    @objc
    func calendarTapped(_ sender: UITapGestureRecognizer) {
        if let tag = sender.view?.tag {
            if tag == 0 {
                pushleftCal()
            } else {
                pushrightCal()
            }
        }
    }
    
    func pushleftCal() {
        
    }
    func pushrightCal() {
        
    }
  

}

extension PointVC: CalendarDelegate {
    func getDate(date: Date) {
        print("data")
    }
    
}
