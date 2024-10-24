//
//  MainPresenter.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/24/24.
//

protocol MainViewPresenter {
    func viewDidLoad()
}


class MainPresenter: MainViewPresenter {
    
    var user: User?
   
    var view: MainView
    
    init(view: MainView) {
        self.view = view
    }
    
    func getUser() {
        self.user = Model.shared.getUser()
    }
    
    func setDatas() {
        guard let user = self.user else {return}
        let textAttribute = CustomTextAttribute.shared.colorize(text: "안녕하세요,\n\(user.userInfo.username)님!", target: "\(user.userInfo.username)", color: maincolor)
        view.setWelcome(text: textAttribute)
        view.setPoint(point: String(describing: user.userInfo.point))
    }

    
    
    func viewDidLoad() {
        
        getUser()
        setDatas()

    }
    
    
    
    
}
