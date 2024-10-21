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
    
    
    
    
    //  기기 권한 팝업
    lazy private var permissionpopup = PermissionPopUp(frame: self.view.frame, delegate: self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        makelogo()
        makecopyrightlabel()
        
        print("didaload")
        self.view.addSubview(permissionpopup)
        permissionpopup.alpha = 0
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("didAppear")
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.2) { [unowned self] in
                   self.permissionpopup.alpha = 1
               }
        // 기기 권한 승낙을 했으면 다음부터 안띄우고 타이머로 다음 화면으로 넘어감
        // 지금은 일단 true
//        if UserDefaults.standard.bool(forKey: userstandard.setpermissionpopup.rawValue) == true {
//        if true {
////
//        } else {
//            presenter.runtimer()
//        }
//        
    }
    
    
    
    
}

extension SplashVC: PermissionPopUpDelegate {
/**
     기기 권한 팝업 승락 버튼 이벤트
      스캐너 화면으로 넘어감
 */
    func permissionallowbtnpressed() {
//        UserDefaults.standard.set(false, forKey: userstandard.setpermissionpopup.rawValue)
        
        let firstVC = UINavigationController(rootViewController: MainVC())
        firstVC.view.backgroundColor = .white
        let secondVC = UINavigationController(rootViewController: ViewController())
        let thirdVC = UINavigationController(rootViewController: UIViewController())
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstVC, secondVC, thirdVC], animated: true)
        
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
            
        }
    }
    
    
    
}
extension SplashVC {
/**
     스캐너 화면으로 넘어가는 함수
 */
    func showScannerViewController() {
        let view = ViewController()
        self.navigationController?.pushViewController(view, animated: true)
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
       // copyrightlabel.textColor = .rgb(red: 26, green: 141, blue: 247, alpha: 1)
        copyrightlabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        copyrightlabel.textColor = maincolor
        copyrightlabel.adjustsFontSizeToFitWidth = true
        copyrightlabel.text = "©WATERGENESIS Inc"
    }
    
    
    
    
    
}
