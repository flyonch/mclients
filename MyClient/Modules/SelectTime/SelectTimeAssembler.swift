//
//  SelectTimeAssembler.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import Foundation
import Swinject

class SelectTimeAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(SelectTimeVC.self) { r in
            let viewController = SelectTimeVC(nibName: "SelectTimeVC", bundle: nil)
            let interactor = SelectTimeInteractor()
            let presenter = SelectTimePresenter()
            let router = SelectTimeRouter()


            interactor.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = viewController
            router.view = viewController
//            router.transitionHandler = viewController
            viewController.presenter = presenter

            return viewController
        }
    }
}

