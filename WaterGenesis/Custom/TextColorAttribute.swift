//
//  TextColorAttribute.swift
//  WaterGenesis
//
//  Created by 양승완 on 10/24/24.
//

import Foundation
import UIKit

class TextColorAttribute {
    
    static let shared = TextColorAttribute()
    
    // 메인 텍스트와, 색상을 적용할 부분 문자열과 색상을 매개변수로 받는 함수
    func colorize(text: String, target: String, color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        
        // target 문자열의 범위를 찾아서 색상 속성 적용
        let range = (text as NSString).range(of: target)
        if range.location != NSNotFound {
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
        }
        
        return attributedString
    }
}
