//
//  API.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//

import Alamofire
import ObjectMapper
import RxSwift
import Foundation

class UserApiDatasource: UserApiProtocol {
    
    let baseURL = "http://localhost:5001/api/"
    
    
    func getUserToken(email: String, password: String) -> Observable<tokenModel> {
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        let jsonData = try! JSONSerialization.data(withJSONObject: parameters)
        
        let url = baseURL + "login"
        
        return Observable.create { observer in
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = HTTPMethod.post.rawValue
            request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            request.setValue("\(jsonData.count)", forHTTPHeaderField: "Content-Length")
            request.httpBody = jsonData
            
            AF.request(request)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: tokenModel.self) { response in
                    print("❗️URL req: ", url )
                    switch response.result {
                    case .success(let data):
                        print("SUCCSECC🎉")
                        observer.onNext(data)
                        observer.onCompleted()
                    case .failure(let error):
                        print("FAIL🔴")
                        if let responseData = response.data,
                           let tokenError = try? JSONDecoder().decode(tokenErrorModel.self, from: responseData) {
                            let errorMessage = tokenError.message ?? "Unknown error"
                            let error = NSError(domain: url, code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                            observer.onError(error)
                        } else {
                            observer.onError(error)
                        }
                    }

                }
            return Disposables.create()
        }
        
    }
    
    
    func getRefreshToken() -> Observable<tokenModel> {
        let url = baseURL + "refresh"

        return Observable.create { observer in
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = HTTPMethod.get.rawValue
            request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")

            let cookieValue = UserManager.getTokens().refreshToken!
            let cookie = HTTPCookie(properties: [
                .domain: url ,
                .path: "/",
                .name: "refreshToken",
                .value: cookieValue ,
                .secure: "TRUE",
                .expires: Date().addingTimeInterval(31536000) // one year from now
            ])
            let cookieHeader = HTTPCookie.requestHeaderFields(with: [cookie!])
            request.allHTTPHeaderFields = cookieHeader

            AF.request(request)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: tokenModel.self) { response in
                    print("❗️URL req: ", url )
                    switch response.result {
                    case .success(let token):
                        print("SUCCSECC🎉")
                        observer.onNext(token)
                        observer.onCompleted()
                    case .failure(let error):
                        print("FAIL🔴")
                        if let responseData = response.data,
                           let tokenError = try? JSONDecoder().decode(tokenErrorModel.self, from: responseData) {
                            let errorMessage = tokenError.message ?? "Unknown error"
                            let error = NSError(domain: url, code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                            observer.onError(error)
                        } else {
                            observer.onError(error)
                        }
                    }
                }
            return Disposables.create()
        }
    }
    
    
    func getUserData(userId: Int) -> Observable<UserDataModel> {
        
        let token = UserManager.getTokens().accessToken
        print(" access token ", token!)
        
        let url = baseURL + "user/show/profile?user_id=\(userId)"
        
        return Observable.create { observer in
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = HTTPMethod.get.rawValue
            request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")

            AF.request(request)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: UserDataModel.self) { response in
                    print("❗️URL req: ", url )
                    switch response.result {
                    case .success(let data):
                        print("SUCCSECC🎉")
                        observer.onNext(data)
                        observer.onCompleted()
                    case .failure(let error):
                        print("FAIL🔴")
                        if let responseData = response.data,
                           let tokenError = try? JSONDecoder().decode(tokenErrorModel.self, from: responseData) {
                            let errorMessage = tokenError.message ?? "Unknown error"
                            let error = NSError(domain: url, code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                            observer.onError(error)
                        } else {
                            observer.onError(error)
                        }
                    }

                }
            return Disposables.create()
        }
        
    }

}
