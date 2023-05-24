//
//  AuthAssembler.swift
//  MyClient
//
//  Created by Leonid Fedorov on 08.05.2023.
//

import Foundation
import Swinject

class RegistrationAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(RegistrationVC.self) { r in
            let viewController = RegistrationVC(nibName: "RegistrationVC", bundle: nil)
            
            let interactor = RegistrationInteractor()
            let presenter = RegistrationPresenter()
            let router = RegistrationRouter()
                        
            interactor.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = viewController
            router.transitionHandler = viewController
            viewController.presenter = presenter
            
            return viewController
        }
    }
}
