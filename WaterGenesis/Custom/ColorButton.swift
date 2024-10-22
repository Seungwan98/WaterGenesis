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
        self.setTitle(text, for: .normal)
        


    }
  
    
    
    private func setUp() {
        self.backgroundColor = maincolor


        
    }
}
class WhiteButton: UIButton {
    
    
    init() {
        super.init(frame: .zero)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setTitle(text: String) {
        self.setTitle(text, for: .normal)

        self.setTitleColor(maincolor, for: .normal)


    }
  
    private func setUp() {
        self.backgroundColor = .white


        
    }
}
