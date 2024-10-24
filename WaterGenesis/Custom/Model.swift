//
//  Model.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/24/24.
//


class Model {
    static let shared = Model()
    
    var user: User?
    
    func getUser() -> User? {
        return self.user
        
    }
    func setUser(user: User) {
        print("serUSer \(user)")
        self.user = user
    }
    
    func setQr(qr: Qr){
        guard let user = self.user else {return}
        let newUser = User(userInfo: UserInfo(username: user.userInfo.username, email: user.userInfo.email, point: user.userInfo.point, department: user.userInfo.department ), stats: Stats(cumulativeCount: qr.cumulativeCount, monthlyCount: qr.monthlyCount, greenhouseGas: qr.greenhouseGas, pineTreeCount: qr.pineTreeCount))
        
        
        self.user = newUser
        
    }
}
