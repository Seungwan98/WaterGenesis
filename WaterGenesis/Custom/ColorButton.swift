//
//  ColorButton.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/21/24.
//

import UIKit
import Then
class ColorButton: UIButton {
    
    
    
    init() {
        super.init(frame: .zero)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setTitle(text: String) {
        self.setTitle("", for: .normal)
        self.titleLabel?.textColor = .white


    }
  
    private func setUp() {
        self.backgroundColor = maincolor


        
    }
}
class whiteButton: UIButton {
    
    
    init() {
        super.init(frame: .zero)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setTitle(text: String) {
        self.setTitle("", for: .normal)
        self.titleLabel?.textColor = maincolor


    }
  
    private func setUp() {
        self.backgroundColor = .white


        
    }
}
