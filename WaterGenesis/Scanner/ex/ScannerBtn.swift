//
//  ScannerBtn.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/21/24.
//

import Foundation
import UIKit

/**
스마트 렌즈, 바코드 렌즈 컴포넌트 화면
*/
class ScannerBtn: UIButton {
    
    private var label = PaddingLabel()
    
    private var dot = UIImageView()
    
    override var isSelected: Bool {
        didSet {
            dot.isHidden = !isSelected
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makelabel()
        makedot()
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async { [unowned self] in
            self.dot.tocircle()
        }
    }
/**
     바코드 인지 스마트인지 텍스트를 셋하는 함수
 */
    func setlabel(label: String) {
        self.label.text = label
    }
}
extension ScannerBtn {
    private func makelabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
    }
    private func makedot() {
        self.addSubview(dot)
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 7).isActive = true
        dot.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        dot.widthAnchor.constraint(equalToConstant: 10).isActive = true
        dot.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        dot.backgroundColor = .white
    }
    
    
    
}
