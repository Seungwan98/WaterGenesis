//
//  SplashPresenter.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/24/24.
//

import Foundation


class SplashPresenter {
    
    var timer = Timer()
    
    var view: SplashVC?
    
    
    init(view: SplashVC) {
        self.view = view
        
    }
    
    private var maxseconds: Int = 2
    
    func runtimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector((updatetimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updatetimer() {
        maxseconds = maxseconds - 1
        
        if maxseconds == 0 {
            timer.invalidate()
            
            if let refreshToken = Token.shared.getRefreshToken() {
                print("\(refreshToken)")
                requestPost(url: "https://dev.waterlabelserver.com/v1/auth/token/refresh", method: "POST", param: ["refresh": refreshToken], completionHandler: { com, result in
                    
                    if com {
                        if let res = result as? Response {
                            Token.shared.setAccessToken(token: res.access)
                            Token.shared.setRefreshToken(token: res.refresh)
                            requestGet(bearer: res.access, url: "https://dev.waterlabelserver.com/v1/auth/me", model: "User", completionHandler: { getCom, getResult in
                                if getCom {
                                    if let user = getResult as? User {
                                        Model.shared.setUser(user: user )
                                        self.view?.pushMain()

                                    }
                                } else {
                                    self.view?.pushLogin()
                                }
                            })
                            
                            
                        } else {
                            
                            
                            self.view?.pushLogin()
                        }
                    } else {
                        
                        // result False 일떄
                        // refresh Token Invalid시 재 로그인
                        self.view?.pushLogin()
                        
                    }
                    
                })
                
            } else {
                print("UserDefaults Nil")
                self.view?.pushLogin()
                
            }
            return
        } else if maxseconds < 0 {
            timer.invalidate()
            return
        }
        
    }
}
