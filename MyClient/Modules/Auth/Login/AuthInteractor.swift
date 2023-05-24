//
//  AuthInteractor.swift
//  MyClient
//
//  Created by Leonid Fedorov on 07.05.2023.
//

import Foundation

class AuthInteractor: AuthInteractorInputProtocol {
    var presenter: AuthInteractorOutputProtocol?
    
    let apiDatasource = UserApiDatasource()


    func getToken(email: String, password: String) {
        let tokenObservable = apiDatasource.getUserToken(email: email, password: password)

        tokenObservable.subscribe(onNext: { token in
            print("☢️ Token получен: \(token)")
            UserManager.saveTokens(token.accessToken!, token.refreshToken!)
            self.presenter?.navigationToMainVC(data: token)
        }, onError: { error in
            print("Error occurred: \(error.localizedDescription)")
            CustomAlert.showAlert(withTitle: "Ошибка", message: error.localizedDescription , actionTitle: "OK", cancelTitle: "Отмена")
        })
    }
    
    func getRefresh() {
        let tokenObservable = apiDatasource.getRefreshToken()

        tokenObservable.subscribe(onNext: { token in
            print("☢️ Token received refresh: \(token)")
            UserManager.saveTokens(token.accessToken!, token.refreshToken!)
        }, onError: { error in
            print("Error occurred: \(error.localizedDescription)")
            CustomAlert.showAlert(withTitle: "Ошибка", message: error.localizedDescription , actionTitle: "OK", cancelTitle: "Отмена")
        })
    }
    
}
