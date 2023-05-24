//
//  AuthPresenter.swift
//  MyClient
//
//  Created by Leonid Fedorov on 07.05.2023.
//

import Foundation
import UIKit

class AuthPresenter: AuthPresenterProtocol, AuthInteractorOutputProtocol {
    var view: AuthViewProtocol?
    var interactor: AuthInteractorInputProtocol?
    var router: AuthRouterProtocol?
    
    func navigateToRegistration(vc: UIViewController) {
        router?.navigateToRegistration(vc: vc)
    }
    
    func checkLogin(email: String, password: String) {
        interactor?.getToken(email: email, password: password)
    }
    
    func navigationToMainVC(data: tokenModel) {
        UserManager.saveTokens(data.accessToken!, data.refreshToken!)
        UserManager.setUserId(userId: data.userId!, userRole: data.userrole!)

        router?.navigateToMain()
    }
}
