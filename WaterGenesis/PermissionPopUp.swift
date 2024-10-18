//
//   PermissionPopUp.swift
//   Ino_Mask
//
//   Created by sangmin han on 2020/08/24.
//   Copyright © 2020 sangmin han. All rights reserved.
//

import Foundation
import UIKit


protocol PermissionPopUpDelegate: NSObjectProtocol {
    func permissionallowbtnpressed()
}
/**
 기기 권한 팝업
 */
class PermissionPopUp: UIView {
    
    private var box = ShadowView()
    
    private var titlelabel = PaddingLabel()
    
    private var pictureimage = UIImageView()
    
    private var picturetitle = PaddingLabel()
    
    lazy private var nestedstack1: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [pictureimage, picturetitle, UIView()])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 8
        stack.alignment = .leading
        return stack
    }()
    
    private var picturecontent = PaddingLabel()
    
    private var cameraimage = UIImageView()
    
    private var cameratitle = PaddingLabel()
    
    lazy private var nestedstack2: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cameraimage, cameratitle, UIView()])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 8
        stack.alignment = .leading
        return stack
    }()
    
    private var cameracontent = PaddingLabel()
    
    private var notyimage = UIImageView()
    
    private var notytitle = PaddingLabel()
    
    lazy private var nestedstack3: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [notyimage, notytitle, UIView()])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 8
        stack.alignment = .leading
        return stack
    }()
    
    private var notycontent = PaddingLabel()
    
    private var localimage = UIImageView()
    
    private var localtitle = PaddingLabel()
    

    
    
    
    lazy private var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nestedstack1, picturecontent, nestedstack2, cameracontent, nestedstack3, notycontent])
        stack.axis = .vertical
        stack.spacing = 18
        stack.distribution = .fill
        stack.setCustomSpacing(10, after: nestedstack1)
        stack.setCustomSpacing(10, after: nestedstack2)
        stack.setCustomSpacing(10, after: nestedstack3)
        
        
        return stack
    }()
    
    private var allowbtn = UIButton()
    
    weak var delegate: PermissionPopUpDelegate?
    
    init(frame: CGRect, delegate: PermissionPopUpDelegate) {
        super.init(frame: frame)
        self.delegate = delegate
        self.backgroundColor = UIColor.init(white: 0, alpha: 0.2)
        makestack()
        maketitle()
        makeallowbtn()
        makebox()
        
        allowbtn.addTarget(self, action: #selector(allowbtnpressed(sender:)), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
/**
     기기 권한 팝업 버튼 이벤트 함수
 */
    @objc func allowbtnpressed(sender: UIButton) {
        UIView.animate(withDuration: 0.2) { [unowned self] in
            self.alpha = 0
        }
        self.delegate?.permissionallowbtnpressed()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async { [unowned self] in
            self.box.layer.cornerRadius = 20
            self.allowbtn.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 20)
        }
    }
    
    
    
}

extension PermissionPopUp {
    
    private func makestack() {
        self.addSubview(mainStack)
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        mainStack.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        mainStack.widthAnchor.constraint(equalToConstant: 240).isActive = true
        mainStack.heightAnchor.constraint(lessThanOrEqualToConstant: 1000).isActive = true
        
        pictureimage.image = UIImage(named: "pictureIcon")
        pictureimage.contentMode = .scaleAspectFill
        picturetitle.textColor = .rgb(red: 51, green: 51, blue: 51, alpha: 1)
        picturetitle.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        picturetitle.text = "사진"
        picturecontent.numberOfLines = 0
        picturecontent.lineBreakMode = .byWordWrapping
        picturecontent.textColor = .rgb(red: 153, green: 153, blue: 153, alpha: 1)
        picturecontent.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        picturecontent.text = "휴대전화의 사진, 미디어, 기타 파일을 다운로드하고 WATERGENESIS로 전송하기 위해서는 사진 허용이 필요합니다."
        
        cameraimage.image = UIImage(named: "cameraIcon")
        cameraimage.contentMode = .scaleAspectFill
        cameratitle.textColor = .rgb(red: 51, green: 51, blue: 51, alpha: 1)
        cameratitle.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        cameratitle.text = "카메라"
        cameracontent.numberOfLines = 0
        cameracontent.lineBreakMode = .byWordWrapping
        cameracontent.textColor = .rgb(red: 153, green: 153, blue: 153, alpha: 1)
        cameracontent.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        cameracontent.text = "카메라를 사용해 사진이나 동영상을 촬영하기 위해서는 카메라 허용이 필요합니다."
        
        notyimage.image = UIImage(named: "notiIcon")
        notyimage.contentMode = .scaleAspectFill
        notytitle.textColor = .rgb(red: 51, green: 51, blue: 51, alpha: 1)
        notytitle.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        notytitle.text = "알림"
        notycontent.numberOfLines = 0
        notycontent.lineBreakMode = .byWordWrapping
        notycontent.textColor = .rgb(red: 153, green: 153, blue: 153, alpha: 1)
        notycontent.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        notycontent.text = "WATERGENESIS 서비스 이용 중 필요한 정보를 이용자에게 알려주기 위해서는 알림 허용이 필요합니다."
       
        
    }
    private func maketitle() {
        self.addSubview(titlelabel)
        
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        titlelabel.bottomAnchor.constraint(equalTo: mainStack.topAnchor, constant: -31).isActive = true
        titlelabel.widthAnchor.constraint(equalToConstant: 256).isActive = true
        titlelabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        titlelabel.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        titlelabel.textColor = .rgb(red: 51, green: 51, blue: 51, alpha: 1)
        titlelabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titlelabel.textAlignment = .center
        titlelabel.numberOfLines = 0
        titlelabel.lineBreakMode = .byWordWrapping
        titlelabel.text = "권한 허용"
        
    }
    private func makeallowbtn() {
        self.addSubview(allowbtn)
        allowbtn.translatesAutoresizingMaskIntoConstraints = false
        allowbtn.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 20).isActive = true
        allowbtn.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        allowbtn.widthAnchor.constraint(equalToConstant: 340).isActive = true
        allowbtn.heightAnchor.constraint(equalToConstant: 66).isActive = true
        
        allowbtn.backgroundColor = maincolor
        allowbtn.setTitle("확인", for: .normal)
        allowbtn.setTitleColor(.white, for: .normal)
        allowbtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
    }
    private func makebox() {
        self.addSubview(box)
        box.backgroundColor = .white
        box.translatesAutoresizingMaskIntoConstraints = false
        box.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        box.widthAnchor.constraint(equalToConstant: 340).isActive = true
        box.topAnchor.constraint(equalTo: titlelabel.topAnchor, constant: -20).isActive = true
        box.bottomAnchor.constraint(equalTo: allowbtn.bottomAnchor, constant: 0).isActive = true
        box.heightAnchor.constraint(equalToConstant: 540).isActive = true
        
        box.shadowcolor = .black
        box.shadowoffset = CGSize(width: 0, height: 3)
        box.shadowradius = 8
        box.shadowopacity = 0.16
        
        self.sendSubviewToBack(box)
    }
    
    
    
    
}
