//
//  ScannerPresenter.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/22/24.
//

import Foundation

protocol PointViewPresenter {
    init(view: PointVC)
    func viewDidLoad()
  
  
}

class PointPresenter: PointViewPresenter {
    
    let view: PointVC
    
    var leftDate: Date?
    var rightDate: Date?
    
    required init(view: PointVC) {
        self.view = view
    }
    
    func viewDidLoad() {
        //
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
