//
//  Stoke.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/21/24.
//
import UIKit
import Then
class Stroke: UIView {
    
    
    
    init() {
        super.init(frame: .zero)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError()
        setUp()
    }
    
  
  
    private func setUp() {
        self.layer.borderColor = maincolor.cgColor
        self.layer.borderWidth = 3
        
        self.snp.makeConstraints {
            $0.height.equalTo(1)
        }
        
        


        
    }
}
