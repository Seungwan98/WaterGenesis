//
//  ShadowView.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/18/24.
//



import Foundation
import UIKit




class ShadowView: UIView {
    
    
    var shadowcolor = UIColor()
    var shadowradius: CGFloat = 0
    var shadowopacity: Float = 0
    var shadowoffset = CGSize()
    
    override func didMoveToWindow() {
        self.layer.shadowColor = shadowcolor.cgColor
        self.layer.shadowRadius = shadowradius
        self.layer.shadowOpacity = shadowopacity
        self.layer.shadowOffset = shadowoffset
        
    }
    
    
}


class ShadowBtn: UIButton {
    
    
    var shadowcolor = UIColor()
    var shadowradius: CGFloat = 0
   var shadowopacity: Float = 0
    var shadowoffset = CGSize()
    
    override func didMoveToWindow() {
        self.layer.shadowColor = shadowcolor.cgColor
        self.layer.shadowRadius = shadowradius
        self.layer.shadowOpacity = shadowopacity
        self.layer.shadowOffset = shadowoffset
        
    }
}
