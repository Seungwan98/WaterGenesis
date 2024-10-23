//
//  LoginVC.swift
//  WaterGenesis
//
//  Created by 양승완 on 10/24/24.
//

import Foundation
import UIKit
import Then
import SnapKit



class LoginVC: UIViewController {
    

    
    lazy var emailTextField = UITextField().then {
        $0.placeholder = "이메일 주소를 입력하세요."
        $0.layer.cornerRadius = 25
        $0.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        
  
        
    }

    lazy var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요."
        $0.layer.cornerRadius = 25

        $0.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        $0.isSecureTextEntry = true
        
       
    }
   

    let mainLogo = UIImageView().then {
        $0.image = UIImage(named: "mainLogo")
        $0.contentMode = .scaleAspectFit
    }
    
    let loginButton = ShadowBtn().then {
        
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.backgroundColor = UIColor(white: 0.9, alpha: 1)
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .white
    }
    
    let findIdButton = UIButton(type: .system).then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(maincolor, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    
    
    let findPasswordButton = UIButton(type: .system).then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(maincolor, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
   
    let signUpButton = UIButton(type: .system).then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(maincolor, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }

    let separatorLabel = UILabel().then {
        $0.text = "/"
        $0.textColor = maincolor
        
    }
 
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(mainLogo)
        
       
        
        setupTextFields()
        setupLoginButton()
        setupLinks()
        mainLogo.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.top.equalToSuperview().inset(100)
            
        }
        
    }
    
    func setupTextFields() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        

        
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 40)) // 원하는 너비로 설정
        emailTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 40)) // 원하는 너비로 설정
        emailTextField.leftViewMode = .always
        emailTextField.rightViewMode = .always
        
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 40)) // 원하는 너비로 설정
        passwordTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 40)) // 원하는 너비로 설정
        passwordTextField.leftViewMode = .always
        passwordTextField.rightViewMode = .always
        
        emailTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(280)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.trailing.height.equalTo(emailTextField)
            
        }

    }
    
   
    func setupLoginButton() {
        // 로그인 버튼
     
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(500)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
     
    }
    
    func setupLinks() {
        view.addSubview(findIdButton)
        view.addSubview(findPasswordButton)
        view.addSubview(signUpButton)
        view.addSubview(separatorLabel)
        
        separatorLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(570)
            $0.centerY.equalTo(findIdButton)
            $0.centerX.equalToSuperview()

        }
        findIdButton.snp.makeConstraints {
            $0.trailing.equalTo( separatorLabel.snp.leading).offset(-16)

        }
      
        findPasswordButton.snp.makeConstraints {
            $0.centerY.equalTo(findIdButton)
            $0.leading.equalTo( separatorLabel.snp.trailing).offset(16)
        }
        signUpButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(620)
            $0.centerX.equalToSuperview()
        }
        
 
    }
}
