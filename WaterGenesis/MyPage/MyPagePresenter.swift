//
//  MyPagePresenter.swift
//  WaterGenesis
//
//  Created by 양승완 on 10/23/24.
//

import Foundation
protocol MyPageViewPresenter {
    func viewWillAppear() 
}
class MyPagePresenter: MyPageViewPresenter {
    
    let view: MyPageView
    
    var user: User?
    
    init(view: MyPageView) {
        self.view = view
    }
    
    func viewWillAppear() {
        print("viewWill")
        self.user = Model.shared.getUser()
        setDatas()
        
        
        
    }
    func setDatas() {
        guard let user = user else {return}
        view.setEmail(text: user.userInfo.email)
        view.setName(text: user.userInfo.username)
        
    }
}
