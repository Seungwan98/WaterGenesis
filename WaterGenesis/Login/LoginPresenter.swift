//
//  LoginPresenter.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/24/24.
//

protocol LoginViewPresenter {
    init(view: LoginView)
    func detectFields(_ email: String, _ password: String)
    
}

class LoginPresenter: LoginViewPresenter {
   
    
    var email: String?
    var password: String?
    func loginBtnTapped() {
        requestPost(url: "https://dev.waterlabelserver.com/v1/auth/sign-in?client=com.app.watergenesis", method: "POST", param: ["email": self.email!, "password": self.password!], completionHandler: { com, result in
            
            if com {
                if let res = result as? Response {
                    print("tokenSharedset")
                    Token.shared.setAccessToken(token: res.access)
                    Token.shared.setRefreshToken(token: res.refresh)
                    requestGet(bearer: res.access, url: "https://dev.waterlabelserver.com/v1/auth/me", model: "User", completionHandler: { getCom, getResult in
                        
                        if getCom {
                            if let user = getResult as? User {
                                Model.shared.setUser(user: user)
                                self.view.pushMain()
                            }
                            
                        } else {
                            // alert
                        }
                    
                    })
                    
                    
                } else {
                    
                    
                    // alert처리
                }
            }  else {
                // alert처리


            }
            
            
            
            
        })
    }
    
   
    
    let view: LoginView

    required init(view: LoginView) {
        self.view = view
    }
    func detectFields(_ email: String, _ password: String) {
        
        
        if !email.isEmpty && !password.isEmpty {
            
           
            if email.isValidEmail {
                self.email = email
                self.password = password
                view.btnVisible(true)
                view.waringLabelVisible(false)


            } else {
                view.waringLabelVisible(true)
            }
            
        } else {
            view.btnVisible(false)
            
        }
        
    }
    
    
}
