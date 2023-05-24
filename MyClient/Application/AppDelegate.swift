//
//  AppDelegate.swift
//  MyClient
//
//  Created by Leonid Fedorov on 07.05.2023.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var delegate: AppDelegateDelegate?
    let apiDatasource = UserApiDatasource()

    
    //выполняется до запуска приложения
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if UserManager.getTokens().accessToken?.isEmpty == false {
            getRefresh()
        } else {
            delegate?.didFinishAuthentication(isAuthenticated: false)
        }
        return true
    }
    
    // Проверяем наличие рефреш токена и его валидность - если токен не валиден то показываем экран логина
    func getRefresh() {
        let tokenObservable = apiDatasource.getRefreshToken()
        
        tokenObservable.subscribe(onNext: { token in
            print("☢️ Refresh token valid: \(token.refreshToken!)")
            UserManager.saveTokens(token.accessToken!, token.refreshToken!)
            UserManager.setUserId(userId: token.userId!, userRole: token.userrole!)

            self.delegate?.didFinishAuthentication(isAuthenticated: true)
        }, onError: { error in
            print("Error refreshToken not valid: \(error.localizedDescription)")
            self.delegate?.didFinishAuthentication(isAuthenticated: false)
            CustomAlert.showAlert(withTitle: "Ошибка", message: error.localizedDescription , actionTitle: "OK", cancelTitle: "Отмена")
        })
    }
}

protocol AppDelegateDelegate: AnyObject {
    func didFinishAuthentication(isAuthenticated: Bool)
}
