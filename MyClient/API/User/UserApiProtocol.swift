//
//  UserApiProtocol.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//

import Foundation
import RxSwift

protocol UserApiProtocol {
    func getUserToken(email: String, password: String) -> Observable<tokenModel>
    func getUserData(userId: Int) -> Observable<UserDataModel>
}
