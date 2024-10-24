//
//  UIViewEx.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/18/24.
//

import UIKit

let maincolor = UIColor.rgb(red: 46, green: 182, blue: 170, alpha: 1)


extension UIView {
    func tocircle() {
        self.layer.cornerRadius = self.frame.width / 2
        
    }
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
extension String{

    var isValidEmail: Bool{
        let regExp = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$" //"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        return NSPredicate(format: "SELF MATCHES %@", regExp).evaluate(with: self)
    }
}


