//
//  CalendarView.swift
//  WaterGenesis
//
//  Created by 양승완 on 10/22/24.
//

import Foundation
import FSCalendar
class CalendarView: UIView, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
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
    init() {
        super.init(frame: .zero)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError()
        setUp()
    }
    
    func setUp() {
        self.backgroundColor = .white
        
        
        let calendar = FSCalendar()
        calendar.appearance.headerDateFormat = "MMM , YYYY"
        calendar.appearance.headerTitleFont = WDFont.medium(size: 16)

        calendar.appearance.headerTitleColor = maincolor
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.weekdayFont = WDFont.bold(size: 8)
        calendar.firstWeekday = 2
        calendar.appearance.titleFont = WDFont.regular(size: 8)
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        calendar.placeholderType = .none

       calendar.appearance.titleSelectionColor = .black
        calendar.today = nil
        calendar.headerHeight = 48
        calendar.appearance.headerTitleOffset = .init(x: 0, y: -10)
        
        
        self.addSubview(calendar)
        calendar.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalToSuperview().offset(-30)
        }
        calendar.placeholderType = .none

        calendar.delegate = self
        calendar.dataSource = self
        
        
        self.addSubview(calendar)
    }
    
}
