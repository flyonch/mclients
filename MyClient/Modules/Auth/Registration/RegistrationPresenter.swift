//
//  RegistrationPresenter.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//

import Foundation
import UIKit

class RegistrationPresenter: RegistrationPresenterProtocol, RegistrationInteractorOutputProtocol {

    var view: RegistrationViewProtocol?
    var interactor: RegistrationInteractorInputProtocol?
    var router: RegistrationRouterProtocol?
    
    func activeTest() {
        print("reg ok")
    }
}
