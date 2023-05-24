//
//  AuthAssembler.swift
//  MyClient
//
//  Created by Leonid Fedorov on 07.05.2023.
//

import Foundation
import Swinject

class AuthAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(AuthViewController.self) { r in
            let viewController = AuthViewController(nibName: "AuthViewController", bundle: nil)
            let interactor = AuthInteractor()
            let presenter = AuthPresenter()
            let router = AuthRouter()
                        
            interactor.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = viewController
            router.view = viewController
            router.transitionHandler = viewController
            viewController.presenter = presenter
            
            return viewController
        }
    }
}
