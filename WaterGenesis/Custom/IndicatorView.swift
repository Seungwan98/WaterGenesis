//
//  IndicatorView.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/18/24.
//

import UIKit

class IndicatorView: UIView {
    
    private var spinner = UIActivityIndicatorView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(white: 0.3, alpha: 0.6)
        makespinner()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setvisibilitySpinner(status: Bool) {
        
        if status == true {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
        }
    }
    
    func makespinner() {
        self.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        spinner.widthAnchor.constraint(equalToConstant: 100).isActive = true
        spinner.heightAnchor.constraint(equalToConstant: 100).isActive = true
        spinner.tintColor = .red
        spinner.contentMode = .scaleToFill
        spinner.style = .large
        spinner.color = .red
      
    }
}
