//
//  ShadowView.swift
//  WaterGenesis
//
//  Created by 양승완 on 10/19/24.
//

import Foundation
import UIKit

extension UIView {
    
  
     
   
     
     private func loadView() {
         let shadows = UIView()
   
         shadows.clipsToBounds = false
         self.addSubview(shadows)
         shadows.snp.makeConstraints {
             $0.center.width.height.equalToSuperview()
         }
         lazy var shadowPath0 = UIBezierPath(roundedRect: self.bounds, cornerRadius: 20)
         let layer0 = CALayer()
         layer0.shadowPath = shadowPath0.cgPath
         layer0.shadowColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8).cgColor
         layer0.shadowOpacity = 1
         layer0.shadowRadius = 8
         layer0.shadowOffset = CGSize(width: 0, height: 3)
         layer0.bounds = shadows.bounds
         layer0.position = shadows.center
         shadows.layer.addSublayer(layer0)
         
         let shapes = UIView()
       
         shapes.clipsToBounds = true
         self.addSubview(shapes)
         
         shapes.snp.makeConstraints {
             $0.center.width.height.equalToSuperview()
         }
         
         let layer1 = CALayer()
         layer1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
         layer1.bounds = shapes.bounds
         layer1.position = shapes.center
         shapes.layer.addSublayer(layer1)
         
         shapes.layer.cornerRadius = 20
     }
    
    
    
}
