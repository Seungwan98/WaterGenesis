//
//  splashVC.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/18/24.
//


import Foundation
import UIKit

/**
스플래시 화면 뷰 컨트롤러
 */
class SplashVC: UIViewController {
    
    
    private var logo = UIImageView()
    
    private var copyrighticon = UIImageView()
    
    private var copyrightlabel = PaddingLabel()
    
    var presenter: SplashPresenter?
    
    
    
    //  기기 권한 팝업
    lazy private var permissionpopup = PermissionPopUp(frame: self.view.frame, delegate: self).then {
        $0.alpha = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(permissionpopup)
        

        makelogo()
        makecopyrightlabel()
 
        if UserDefaults.standard.bool(forKey: "permission_success") {
            presenter?.runtimer()

        } else {
            UIView.animate(withDuration: 0.2) { [unowned self] in
                self.permissionpopup.alpha = 1
                self.view.bringSubviewToFront(permissionpopup)
            }
        }
        
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("didAppear")
        super.viewDidAppear(animated)
        
        
       
        
    }
    
    
    
    
}

extension SplashVC: PermissionPopUpDelegate {

    func pushMain() {
        
        DispatchQueue.main.async {
            let mainView = MainVC()
            mainView.presenter = MainPresenter(view: mainView)
            
            let pointView = PointVC()
            pointView.presenter = PointPresenter(view: pointView)
            
            let scannerView =  ScannerViewController()
            scannerView.presenter  = ScannerPresenter(view: scannerView)
            
            let MyPageView =  MyPageVC()
            MyPageView.presenter  = MyPagePresenter(view: MyPageView)

            
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
    func pushLogin() {
        
    
        DispatchQueue.main.async {
            
            let loginView =  LoginVC()
            loginView.presenter = LoginPresenter(view: loginView)
            
            self.navigationController?.viewControllers = [loginView]
        }
        
      


    }
    
    
}

extension SplashVC {
    private func makelogo() {
        self.view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 290).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 70).isActive = true
        logo.image = UIImage(named: "mainLogo.png")
        logo.contentMode = .scaleAspectFit
    }
    private func makecopyrightlabel() {
        self.view.addSubview(copyrightlabel)
        copyrightlabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightlabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -12.5).isActive = true
        copyrightlabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
     
        copyrightlabel.textAlignment = .center
        copyrightlabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        copyrightlabel.textColor = maincolor
        copyrightlabel.adjustsFontSizeToFitWidth = true
        copyrightlabel.text = "©WATERGENESIS Inc"
    }
    
    
    
    
    
}
