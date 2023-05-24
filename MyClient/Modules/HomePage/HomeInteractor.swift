//
//  HomeInteractor.swift
//  MyClient
//
//  Created by Leonid Fedorov on 15.05.2023.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol?
    let apiDatasource = ServiceApiDatasource()


    func getAllService() {
        let tokenObservable = apiDatasource.getAllService()
        
        tokenObservable.subscribe(onNext: { [self] data in
            print("Data Complite😼")
            presenter?.loadData(data: data )
        }, onError: { error in
            print("Error occurred: \(error.localizedDescription)")
        })
    }
    
//    func getUserProfile() {
//        let tokenObservable = apiDatasource.getAllService()
//
//        tokenObservable.subscribe(onNext: { [self] data in
//            print("Data Complite😼")
//            presenter?.loadData(data: data )
//        }, onError: { error in
//            print("Error occurred: \(error.localizedDescription)")
//        })
//    }
    
    
}

