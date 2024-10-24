//
//  API.swift
//  WaterGenesis
//
//  Created by 이노프렌즈 on 10/24/24.
//

import UIKit

class Token {
    static let shared = Token()
    private var accessToken: String?
    private let refreshToken = "refreshToken"
    
    func getAccessToken() -> String? {
        
        return self.accessToken
    }
    
    func setAccessToken(token: String) {
        self.accessToken = token
    }
    
    func getRefreshToken() -> String? {
        return UserDefaults.standard.string(forKey: refreshToken)
    }
    
    func setRefreshToken(token: String) {
        UserDefaults.standard.set(token, forKey: refreshToken)
        
    }
}

struct Qr: Codable {
    let cumulativeCount, monthlyCount, point, rewordPoint: Int
    let greenhouseGas, pineTreeCount: String
}

struct Response: Codable {
    let access: String
    let refresh: String
}


struct User: Codable {
    let userInfo: UserInfo
    let stats: Stats
}

// MARK: - Stats
struct Stats: Codable {
    let cumulativeCount, monthlyCount: Int
    let greenhouseGas, pineTreeCount: String
}

// MARK: - UserInfo
struct UserInfo: Codable {
    let username, email: String
    let point: Int
    let department: String
}




func requestGet(bearer: String, url: String, model: String, completionHandler: @escaping (Bool, Any) -> Void) {
    print("reqeustGET")
    guard let url = URL(string: url) else {
        print("Error: cannot create URL")
        return
    }
    
    // Request
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("Bearer \(bearer)", forHTTPHeaderField: "Authorization")
    
    // Task
    let defaultSession = URLSession(configuration: .default)
    
    defaultSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
        guard error == nil else {
            print("Error occur: error calling GET - \(String(describing: error))")
            return
        }
        
        guard let data = data, let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        
        if let httpRes = response as? HTTPURLResponse {
            print("\(httpRes)  GET")
            
        }
        
        if model == "Qr" {
            guard let output = try? JSONDecoder().decode(Qr.self, from: data) else {
                print("Error: JSON data parsing failed")
                
                return
            }
            completionHandler(true, output)

        }
        else if model == "User" {
            guard let output = try? JSONDecoder().decode(User.self, from: data) else {
                print("Error: JSON data parsing failed")
                
                return
            }
            completionHandler(true, output)

        }
       
        
    }.resume()
}

func requestPost(url: String, method: String, param: [String: Any], completionHandler: @escaping (Bool, Any) -> Void) {
    let sendData = try! JSONSerialization.data(withJSONObject: param, options: [])
    
    guard let url = URL(string: url) else {
        print("Error: cannot create URL")
        return
    }
    print(param)
    var request = URLRequest(url: url)
    request.httpMethod = method
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = sendData
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            completionHandler(false, error!)
            
            return
        }
        guard let data = data else {
            print("Error: Did not receive data")
            return
        }
        let httpRes = response as? HTTPURLResponse
        print("\(httpRes?.statusCode) POST")
        
            

         
        
        guard let output = try? JSONDecoder().decode(Response.self, from: data) else {
            
            print("Error: JSON Data Parsing failed")
            completionHandler(false, httpRes?.statusCode)

            return
        }
        
        completionHandler(true, output)
    }.resume()
}
