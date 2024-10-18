//
//  UIViewEx.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/18/24.
//

import UIKit

let maincolor = UIColor.rgb(red: 46, green: 182, blue: 170, alpha: 1)


extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
extension UIColor {
   static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat ) -> UIColor {
       return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}
extension String {




}
