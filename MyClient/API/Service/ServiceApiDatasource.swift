//
//  ServiceApiDatasource.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import Alamofire
import ObjectMapper
import RxSwift
import Foundation

let baseURL = "http://localhost:5001/api/"

class ServiceApiDatasource {
    
    func getAllService() -> Observable<[ServiceModel]> {
        let url = baseURL + "show/typeservices"

        return Observable.create { observer in
            let request = AF.request(url, method: .get, encoding: JSONEncoding.default)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: [ServiceModel].self) { response in
                    print("❗️URL req:", url)
                    print("❗️RES req:", response)

                    switch response.result {
                    case .success(let data):
                        print("SUCCESS🎉")
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

            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    
    func getAllPodService(type_service: Int) -> Observable<[PodServiceModel]> {
        let url = baseURL + "show/services"
        let parameters: [String: Any] = ["type_service": type_service]

        return Observable.create { observer in
            let request = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: [PodServiceModel].self) { response in
                    print("❗️URL req:", url)
                    print("❗️RES req:", response)

                    switch response.result {
                    case .success(let data):
                        print("SUCCESS🎉")
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

            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func getServiceManager(service_id: Int) -> Observable<[serviceManager]> {
        let url = baseURL + "manager/sevice"
        let parameters: [String: Any] = ["service_id": service_id]

        return Observable.create { observer in
            let request = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: [serviceManager].self) { response in
                    print("❗️URL req:", url)
                    print("❗️RES req:", response)

                    switch response.result {
                    case .success(let data):
                        print("SUCCESS🎉")
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

            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func getFreeTimeManager(user_id: Int) -> Observable<[freeTimeManagerModel]> {
        let url = baseURL + "manager/freetime"
        let parameters: [String: Any] = ["user_id": user_id]

        return Observable.create { observer in
            let request = AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: [freeTimeManagerModel].self) { response in
                    print("❗️URL req:", url)
                    print("❗️RES req:", response)

                    switch response.result {
                    case .success(let data):
                        print("SUCCESS🎉")
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

            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    
    func postAppoint(user_id: Int, manager_id: Int, service_id: Int,date_time_service: String, selectTime: String) -> Observable<appointComplitedModel> {
        
        let url = baseURL + "appointment"

        let token = UserManager.getTokens().accessToken
        print("TOKEN", token)
        
        let parameters: [String: Any] = [
            "user_id": user_id,
            "manager_id": manager_id,
            "service_id": service_id,
            "date_time_service": date_time_service,
            "selectTime": selectTime
        ]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: parameters)
                
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.setValue("\(jsonData.count)", forHTTPHeaderField: "Content-Length")
        request.httpBody = jsonData
                
        return Observable.create { observer in
            let request = AF.request(request)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: appointComplitedModel.self) { response in
                    print("❗️URL req:", url)
                    print("❗️RES req:", response)

                    switch response.result {
                    case .success(let data):
                        print("SUCCESS🎉")
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

            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func getShowAppoint(user_id: Int) -> Observable<[showAppointModel]> {
        
        let url = baseURL + "user/show/appointment?user_id=\(user_id)"

        let token = UserManager.getTokens().accessToken
        print("TOKEN", token)
                                
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
                
        return Observable.create { observer in
            let request = AF.request(request)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: [showAppointModel].self) { response in
                    print("❗️URL req:", url)
                    print("❗️RES req:", response)

                    switch response.result {
                    case .success(let data):
                        print("SUCCESS🎉")
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

            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func putCancelAppoint(user_id: Int, status: Bool, appointment_id: Int) -> Observable<statusAppoint> {
        let url = baseURL + "appointment/update/status"
        let token = UserManager.getTokens().accessToken
        print("TOKEN", token)
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethod.put.rawValue
        request.setValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "status": status,
            "user_id": user_id,
            "appointment_id": appointment_id
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = jsonData
        
        return Observable.create { observer in
            let request = AF.request(request)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: statusAppoint.self) { response in
                    print("❗️URL req:", url)
                    print("❗️RES req:", response)
                    
                    switch response.result {
                    case .success(let data):
                        print("SUCCESS🎉")
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
            
            return Disposables.create {
                request.cancel()
            }
        }
    }

}
