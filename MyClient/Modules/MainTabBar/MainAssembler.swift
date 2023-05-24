//
//  mainAssembler.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//

import Foundation
import Swinject

class MainAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(MainVC.self) { r in
            let viewController = MainVC(nibName: "MainVC", bundle: nil)
//            let interactor = MainInteractor()
//            let presenter = MainPresenter()
//            let router = MainRouter()
                        
//            interactor.presenter = presenter
//            presenter.interactor = interactor
//            presenter.router = router
//            presenter.view = viewController
//            router.view = viewController
//            router.transitionHandler = viewController
//            viewController.presenter = presenter
            
            return viewController
        }
    }
}
