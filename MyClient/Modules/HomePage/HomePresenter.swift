//
//  HomePresenter.swift
//  MyClient
//
//  Created by Leonid Fedorov on 15.05.2023.
//

import Foundation
import UIKit

class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {
    
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    
    var allService: [ServiceModel] =  []
    
    
    func loadData(data: [ServiceModel]) {
        allService = data
    }
    
    func getAllService() {
        interactor?.getAllService()
        

    }
    
    func getUserProfile() {
        let userData = UserManager.getUserId()
        getProfileUser(userId: userData.userId!)
    }
    
    func getProfileUser(userId: Int) {
        let apiDatasource = UserApiDatasource()
        let data = apiDatasource.getUserData(userId: userId)
        
        data.subscribe(onNext: { data in
            UserDataManagerProfile.shared.saveData(
                userId: data.user_id,
                userFullName: data.user_fullname,
                userPhone: data.user_phone,
                userEmail: data.user_email,
                isActivated: data.isactivated!,
                userRole: data.userrole,
                avatarURL: data.avatarurl
            )
            self.view?.setupProfile()
        }, onError: { error in
            print(error)
        })
    }
}

