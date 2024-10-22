//
//  ViewController.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/18/24.
//

import UIKit
import SnapKit
import FSCalendar

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendarView = CalendarView()
        self.view.addSubview(calendarView)
        
        calendarView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(300)
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
}
