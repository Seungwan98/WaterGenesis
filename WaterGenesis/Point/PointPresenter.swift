//
//  ScannerPresenter.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/22/24.
//

import Foundation
import UIKit

protocol PointViewPresenter {
    init(view: PointView)
    func viewDidLoad()
  
  
}

class PointPresenter: PointViewPresenter {
    
    let view: PointView
    
    var user: User?
    
    var leftDate: Date?
    var rightDate: Date?
    
    required init(view: PointView) {
        self.view = view
    }
    func getUser() {
        self.user = Model.shared.getUser()
    }
    
    func viewDidLoad() {
        
        getUser()
        setDatas()
    }
    
    func setDatas() {
        guard let user = self.user else {return}

        let textAttribute = CustomTextAttribute.shared.colorize(text: "\(user.userInfo.username)님의\n일회용 컵 절감 \(user.stats.cumulativeCount)개", target: "\(user.userInfo.username)", color: maincolor)
        view.setInform(text: textAttribute)
        
        let camulativeCount = CustomTextAttribute.shared.fontColorChange(text: "\(user.stats.cumulativeCount)회", targetFont: "회", font: WDFont.regular(size: 12), targetColor: "\(user.stats.cumulativeCount)", color: maincolor)
        let monthlyCount = CustomTextAttribute.shared.fontColorChange(text: "\(user.stats.cumulativeCount)회", targetFont: "회", font: WDFont.regular(size: 12), targetColor: "\(user.stats.monthlyCount)", color: maincolor)
        let point = CustomTextAttribute.shared.fontColorChange(text: "\(user.userInfo.point)p", targetFont: "p", font: WDFont.regular(size: 12), targetColor: "\(user.stats.cumulativeCount)", color: maincolor)
        
        let countArr: [NSAttributedString] = [camulativeCount, monthlyCount, point]
        
        view.setStack(arr: countArr)
    }
    
 
    
    
}
extension PointPresenter: CalendarDelegate {
    func getDate(date: Date, tag: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"  // 원하는 형식을 설정

        let dateString = dateFormatter.string(from: date)
        if tag == 0 {
            leftDate = date
            view.setLeft(date: dateString)
        } else {
            rightDate = date
            view.setRight(date: dateString)
        }
    }
    
    
}
