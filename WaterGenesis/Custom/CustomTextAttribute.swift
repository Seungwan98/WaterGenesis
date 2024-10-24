//
//  TextColorAttribute.swift
//  WaterGenesis
//
//  Created by 양승완 on 10/24/24.
//

import Foundation
import UIKit

class CustomTextAttribute {
    
    static let shared = CustomTextAttribute()
    
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
    
    // 메인 텍스트와, 색상을 적용할 부분 문자열과 색상을 매개변수로 받는 함수
    func fontChange(text: String, target: String, font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        
        // target 문자열의 범위를 찾아서 색상 속성 적용
        let range = (text as NSString).range(of: target)
        if range.location != NSNotFound {
            attributedString.addAttribute(.foregroundColor, value: font, range: range)
        }
        
        return attributedString
    }
    
    func fontColorChange(text: String, targetFont: String, font: UIFont, targetColor: String, color: UIColor) -> NSAttributedString {
        let fontAttribute: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: WDFont.medium(size: 18),
            .baselineOffset: 4
        ]

        let colorAttribute: [NSAttributedString.Key: Any] = [
            .foregroundColor: maincolor,
            .font: WDFont.bold(size: 32),
            .kern: 2.0
        ]
        
        let fontRange = (text as NSString).range(of: targetFont)
        let colorRange = (text as NSString).range(of: targetColor)

        

        // NSMutableAttributedString을 사용해 속성 추가
        let attributedString = NSMutableAttributedString(string: text)

        attributedString.addAttributes(fontAttribute, range: fontRange)

        attributedString.addAttributes(colorAttribute, range: colorRange)
        
        return attributedString
    }
}
