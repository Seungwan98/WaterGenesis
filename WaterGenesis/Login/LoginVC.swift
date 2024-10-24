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

protocol LoginView {
    func btnVisible(_ visible: Bool)
    func waringLabelVisible(_ visible: Bool)
    func pushMain()
}



class LoginVC: UIViewController, LoginView {
    func pushMain() {
        DispatchQueue.main.async {
            
            
            let mainView = MainVC()
            
            let pointView = PointVC()
            pointView.presenter = PointPresenter(view: pointView)
            
            let scannerView =  ScannerViewController()
            scannerView.presenter  = ScannerPresenter(view: scannerView)
            
            let MyPageView =  MyPageVC()
            MyPageView.presenter = MyPagePresenter(view: MyPageView)
            
            let firstVC = UINavigationController(rootViewController: mainView)
            
            let secondVC = UINavigationController(rootViewController: pointView)
            
            let thirdVC = UINavigationController(rootViewController: scannerView) // 스캐너
            
            let fourthVC = UINavigationController(rootViewController: MyPageView) // 마이페이지
            
            
            
            let tabBarController = UITabBarController()
            firstVC.view.backgroundColor = .white
            secondVC.view.backgroundColor = .white
            thirdVC.view.backgroundColor = .white
            fourthVC.view.backgroundColor = .white
            tabBarController.setViewControllers([firstVC, secondVC, thirdVC, fourthVC], animated: true)
            
            self.navigationController?.viewControllers = [tabBarController]
            
            tabBarController.tabBar.clipsToBounds = true
            tabBarController.tabBar.tintColor = maincolor
            if let items = tabBarController.tabBar.items {
                items[0].imageInsets = .init(top: 12, left: 12, bottom: 12, right: 12)
                items[0].image = UIImage(named: "homeIcon")
                items[0].title = "홈"
                
                
                items[1].imageInsets = .init(top: 12, left: 12, bottom: 12, right: 12)
                items[1].selectedImage = UIImage(systemName: "pointIcon")?.withTintColor(maincolor)
                items[1].image = UIImage(named: "pointIcon")
                items[1].title = "포인트"
                
                items[2].selectedImage = UIImage(systemName: "cleanIcon")?.withTintColor(maincolor)
                items[2].imageInsets = .init(top: 13, left: 13, bottom: 13, right: 13)
                items[2].image = UIImage(named: "cleanIcon")
                items[2].title = "클린지니"
                
                
                items[3].imageInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
                items[3].selectedImage = UIImage(systemName: "myprofile")?.withTintColor(maincolor)
                items[3].image = UIImage(named: "myprofile")
                items[3].title = "마이페이지"
                
            }
        }
    
    }
    
    func waringLabelVisible(_ visible: Bool) {
        self.warningLabel.isHidden = !visible
    }
    
  
    
    func btnVisible(_ visible: Bool) {
        if visible {
            self.loginButton.isEnabled = true
            self.loginButton.backgroundColor = maincolor
            self.loginButton.setTitleColor(.white, for: .normal)

        }
        else {
            self.loginButton.isEnabled = false
            self.loginButton.backgroundColor = .white
            self.loginButton.setTitleColor(.lightGray, for: .normal)
        }
        
    }
    
    
    
    var presenter: LoginPresenter?
    
    let warningLabel = UILabel().then {
        $0.textColor = .red
        $0.font = WDFont.regular(size: 12)
        $0.text = "올바른 이메일 주소를 입력해주세요."
        $0.isHidden = true
    }

    
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
    
    var loginButton = ShadowBtn().then {
        
        $0.shadowcolor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 0.8)
        $0.shadowopacity = 1
        $0.shadowradius = 8
        $0.shadowoffset = CGSize(width: 0, height: 3)
        
        
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = WDFont.regular(size: 16)
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .white
    }
    
    let findIdButton = UIButton(type: .system).then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(maincolor, for: .normal)
        $0.titleLabel?.font = WDFont.regular(size: 14)
    }
    
    
    let findPasswordButton = UIButton(type: .system).then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(maincolor, for: .normal)
        $0.titleLabel?.font = WDFont.regular(size: 14)
    }
   
    let signUpButton = UIButton(type: .system).then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(maincolor, for: .normal)
        $0.titleLabel?.font = WDFont.regular(size: 14)
    }

    let separatorLabel = UILabel().then {
        $0.text = "/"
        $0.textColor = maincolor
        
    }
     let signUpLabel = UILabel().then {
        $0.text = "아직 회원이 아니신가요?"
         $0.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
         $0.font = WDFont.regular(size: 14)
        
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
        view.addSubview(warningLabel)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        
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
        
        warningLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(1)
            $0.leading.equalTo(emailTextField).inset(10)
            
        }

    }
    
   
    func setupLoginButton() {
     
        view.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        
        loginButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(500)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
     
    }
    @objc
    func loginBtnTapped() {
        presenter?.loginBtnTapped()
    }
    
    func setupLinks() {
        
        let signUpView = UIView().then {
            $0.backgroundColor = .red
        }
        
        view.addSubview(findIdButton)
        view.addSubview(findPasswordButton)
        view.addSubview(separatorLabel)
        
        view.addSubview(signUpView)
        signUpView.addSubview(signUpButton)
        signUpView.addSubview(signUpLabel)
        
      
        
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
        
        signUpView.snp.makeConstraints {
            $0.height.equalTo(20)
            
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(40)
        }
        
     
        
        signUpLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(-20)
        }
        signUpButton.snp.makeConstraints {
            $0.centerY.equalTo(signUpLabel)
            $0.leading.equalTo(signUpLabel.snp.trailing).offset(10)
        }
        
 
    }
}

extension LoginVC: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        if let email = self.emailTextField.text, let password = self.passwordTextField.text {
            print("not nil")
            presenter?.detectFields(email, password)

        }
        
        
     }
   
}
