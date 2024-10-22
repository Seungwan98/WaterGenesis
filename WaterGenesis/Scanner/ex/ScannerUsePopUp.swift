//
//  ScannerUsePopUp.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/21/24.
//



import Foundation
import UIKit

class ScannerUsePopUp: UIView {
    
    private var box = ShadowView()
    
    private var image = UIImageView()
    
    private var titlelabel = PaddingLabel()
    
    private var contentlabel = PaddingLabel()
    
    
    var tapgesture = UITapGestureRecognizer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makebox()
        makeimage()
        maketitlelabel()
        makecontentlabel()
        self.backgroundColor = UIColor.init(white: 0.0, alpha: 0.2)
        
        tapgesture = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
        
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapgesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async { [unowned self] in
            self.box.layer.cornerRadius = 8
        }
    }
    
    @objc func tapped(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.2) { [unowned self] in
            self.alpha = 0
        }
    }
    
}
extension ScannerUsePopUp {
    private func makebox() {
        self.addSubview(box)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        box.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        box.widthAnchor.constraint(equalToConstant: 280).isActive = true
        box.heightAnchor.constraint(equalToConstant: 240).isActive = true
        box.backgroundColor = .white
        
        box.shadowcolor = .black
        box.shadowoffset = CGSize(width: 0, height: 3)
        box.shadowradius = 8
        box.shadowopacity = 0.16
        
    }
    private func makeimage() {
        self.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: box.topAnchor, constant: 30).isActive = true
        image.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        image.widthAnchor.constraint(equalToConstant: 60).isActive = true
        image.heightAnchor.constraint(equalToConstant: 60).isActive = true
        image.image = UIImage(named: "barcodeLensIcon")
    }
    private func maketitlelabel() {
        self.addSubview(titlelabel)
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        titlelabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        titlelabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        titlelabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        titlelabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        titlelabel.textColor = .rgb(red: 51, green: 51, blue: 51, alpha: 1)
        titlelabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        titlelabel.text = "barcodelens_scannerusepopup"
        titlelabel.textAlignment = .center
        
        
    }
    private func makecontentlabel() {
        self.addSubview(contentlabel)
        contentlabel.translatesAutoresizingMaskIntoConstraints = false
        contentlabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 21).isActive = true
        contentlabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        contentlabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        contentlabel.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        
        contentlabel.numberOfLines = 0
        contentlabel.lineBreakMode = .byWordWrapping
        
        contentlabel.textColor = .rgb(red: 153, green: 153, blue: 153, alpha: 1)
        contentlabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        contentlabel.textAlignment = .center
        contentlabel.text = "contentlabel_scannerusepoppup"
        
        
        
    }
}
