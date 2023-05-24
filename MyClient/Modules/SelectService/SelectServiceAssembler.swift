//
//  SelectServiceAssembler.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import Foundation
import Swinject

class SelectServiceAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(SelectServiceVC.self) { r in
            let viewController = SelectServiceVC(nibName: "SelectServiceVC", bundle: nil)
//            let interactor = SelectServiceInteractor()
//            let presenter = SelectServicePresenter()
//            let router = SelectServiceRouter()
//
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
