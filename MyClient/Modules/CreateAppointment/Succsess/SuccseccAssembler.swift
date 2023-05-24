//
//  SuccseccAssembler.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import Swinject
import Foundation

class SuccseccAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(SuccseccVC.self) { r in
            let viewController = SuccseccVC(nibName: "SuccseccVC", bundle: nil)
//            let interactor = SuccseccInteractor()
//            let presenter = SuccseccPresenter()
//            let router = SuccseccRouter()
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
