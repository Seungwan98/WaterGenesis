//
//  CalendarView.swift
//  WaterGenesis
//
//  Created by 양승완 on 10/22/24.
//

import Foundation
import FSCalendar

protocol CalendarDelegate {
    
    func getDate(date: Date, tag: Int)
    
}

class CalendarView: UIView, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    var calendar = FSCalendar()
    
    var delegate: CalendarDelegate
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {

        return .white
    }

    // 선택된 날짜 테두리 색상
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderSelectionColorFor date: Date) -> UIColor? {

        return maincolor
    }

    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
            self.layoutIfNeeded()
        }
    init(delegate: CalendarDelegate) {
        self.delegate = delegate

        super.init(frame: .zero)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError()
        setUp()
    }
    
    func setUp() {
        
        let leftBtn = UIButton().then {
            $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            $0.tintColor = .black
        }
         
        let rightBtn = UIButton().then {
            $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            $0.tintColor = .black
        }
        
        let nextBtn = ColorButton().then {
            $0.setTitle(text: "다음")

            $0.titleLabel?.font = WDFont.bold(size: 10)
            $0.layer.cornerRadius = 5
        }
        
        self.backgroundColor = .white
        
        
        calendar = FSCalendar().then {
            $0.appearance.headerDateFormat = "MMM , YYYY"
            $0.appearance.headerTitleFont = WDFont.medium(size: 16)

            $0.appearance.headerTitleColor = maincolor
            $0.appearance.weekdayTextColor = .black
            $0.appearance.weekdayFont = WDFont.bold(size: 8)
            $0.firstWeekday = 2
            $0.appearance.titleFont = WDFont.regular(size: 8)
            $0.appearance.headerMinimumDissolvedAlpha = 0
            $0.placeholderType = .none

            $0.appearance.titleSelectionColor = .black
            $0.today = nil
            $0.headerHeight = 48
            $0.appearance.headerTitleOffset = .init(x: 0, y: -10)
            $0.placeholderType = .none
        }
        
        calendar.delegate = self
        calendar.dataSource = self
    
        
        
        self.addSubview(calendar)
        self.addSubview(nextBtn)
        
        calendar.addSubview(leftBtn)
        calendar.addSubview(rightBtn)
        
       
      
        
        
        calendar.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().offset(-30)
            $0.height.equalToSuperview().offset(-50)
        }
        nextBtn.snp.makeConstraints {
            $0.width.equalTo(34)
            $0.height.equalTo(20)
            $0.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(10)
        }
        leftBtn.snp.makeConstraints {
            $0.centerY.equalTo(calendar.calendarHeaderView).offset(-5)
            $0.leading.equalToSuperview().inset(60)
            
        }
        rightBtn.snp.makeConstraints {
            $0.centerY.equalTo(calendar.calendarHeaderView).offset(-5)
            $0.trailing.equalToSuperview().inset(60)
            
        }
        

        leftBtn.addTarget(self, action: #selector(leftBtnTapped), for: .touchUpInside)
        rightBtn.addTarget(self, action: #selector(rightBtnTapped), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        
     
        
        
   
    }
    
    @objc
    func leftBtnTapped() {
        print("lft")
        let currentMonth = calendar.currentPage
               let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: currentMonth) ?? Date()
               calendar.setCurrentPage(previousMonth, animated: true)
        
    }
    @objc
    func rightBtnTapped() {
        let currentMonth = calendar.currentPage
                let previousMonth = Calendar.current.date(byAdding: .month, value: 1, to: currentMonth) ?? Date()
        calendar.setCurrentPage(previousMonth, animated: true)
    }
    
    
    @objc
    func nextBtnTapped() {
        if let selectedDate = calendar.selectedDate {
            delegate.getDate(date: selectedDate, tag: self.tag)
        } else {
            print("err")
        }
        
        
    }
    
    
}
