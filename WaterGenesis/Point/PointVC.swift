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
    func setLeft(date: String)
    func setRight(date: String)
}

class PointVC: UIViewController {
   
    
    
    var presenter: PointPresenter?
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
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
        $0.font = WDFont.bold(size: 26)
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
    
    lazy var mainStack = UIStackView(arrangedSubviews: [firstStack, secondStack]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        
        

        
    }
    let firstStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center

    }
    let secondStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        



    }
    
    let leftCalBtn = UIView()
    let rightCalBtn = UIView()
    
    var labels = [UILabel]()
    
    lazy var calStack = UIStackView(arrangedSubviews: [leftCalBtn, rightCalBtn]).then {
        $0.spacing = 20
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    let search = ColorButton().then {
        $0.setTitle(text: "검색")
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = WDFont.bold(size: 20)
    }

    let leftCalendarView = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 18
        
        
    } 
    let rightCalendarView = ShadowView().then {
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 18
        
        
    }
    
    var calendarConstraint: Constraint?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        hideCalendar()
        setUI()
        setBottomView()
        setStackView()
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
    
    func setStackView() {
        self.middleView.addSubview(self.mainStack)
        let texts: [String] =  ["누적 스캔 횟수", "이달의 스캔 횟수", "보유 포인트"]
        let textN = ["0", "5", "350"]
       _ = texts.enumerated().map { count, text in
           
           let firstLabel = UILabel()
           firstLabel.text = textN[count]
           firstLabel.font = WDFont.bold(size: 24)
           firstLabel.textAlignment = .center

          
           firstStack.addArrangedSubview(firstLabel)
           
         
           
           let secondLabel = UILabel()
           secondLabel.text = text
           secondLabel.textAlignment = .center
           secondLabel.font = WDFont.regular(size: 12)
           secondLabel.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        
           secondStack.addArrangedSubview(secondLabel)
           
           
        }
        
        
        
        mainStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(20)
            
        }
  
    
        
        
    }
    
    func setUI() {
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        
  
        
        self.contentView.addSubview(middleView)
        self.contentView.addSubview(informlabel)
        self.contentView.addSubview(manImage)
        self.contentView.addSubview(pointIcon)
        self.contentView.addSubview(pointInform)

       
        
        scrollView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.width.height.equalToSuperview()
            
        }
     

        middleView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(getHeight(height: 80))
            $0.top.equalTo(self.informlabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        informlabel.snp.makeConstraints {
            $0.height.equalTo(getHeight(height: 80))
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.top.equalToSuperview()
        }
        
        manImage.snp.makeConstraints {
            $0.width.equalTo(getHeight(height: 113.21))
            $0.height.equalTo(getHeight(height: 119))
            $0.trailing.equalTo(informlabel)
            $0.top.equalTo(informlabel)
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
        self.contentView.addSubview(calStack)
        self.contentView.addSubview(search)
    
        

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
            
            let label = UILabel()
            
            label.font = WDFont.regular(size: 16)
            label.text = "2025.01.05"
            
            labels.append(label)

            
            image.transform = transform
            stack.addSubview(image)
            stack.addSubview(label)
            
            image.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview()
                
            } 
            
            label.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().inset(8)
                
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
        let calArr = [leftCalendarView, rightCalendarView]

    
      
        for i in 0..<calArr.count {
            
            calArr[i].isHidden = true
            
            let calendar = CalendarView(delegate: presenter!).then {
                $0.tag = i
                $0.layer.cornerRadius = 20
            }
            
            calArr[i].addSubview(calendar)
            self.view.addSubview(calArr[i])
            
            
            
            calendar.snp.makeConstraints {
                
                $0.width.height.equalToSuperview()
            }
            
            
            calArr[i].snp.makeConstraints {
                $0.top.equalTo(calStack.snp.bottom).offset(4)
                $0.width.height.equalTo(240)
                
            }
            
            
            
            
            
        }
        
        
        
        
        
        leftCalendarView.snp.makeConstraints {
            $0.leading.equalTo(calStack)
        }
        rightCalendarView.snp.makeConstraints {
            $0.trailing.equalTo(calStack)
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
     
        leftCalendarView.isHidden = false
        rightCalendarView.isHidden = true
        
    }
    func pushrightCal() {
        
           leftCalendarView.isHidden = true
           rightCalendarView.isHidden = false
    }
  

}


extension PointVC: PointView {
    func setLeft(date: String) {
        self.labels[0].text = date
        self.leftCalendarView.isHidden = true
        
    }
    
    func setRight(date: String) {
        self.labels[1].text = date
        self.rightCalendarView.isHidden = true


    }
    
}


extension PointVC {
    func hideCalendar() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                     action: #selector(hide))
        self.contentView.addGestureRecognizer(tap)
       
        }
        
       @objc func hide() {
           self.leftCalendarView.isHidden = true
           self.rightCalendarView.isHidden = true
       }
}
