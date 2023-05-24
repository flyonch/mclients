//
//  MyAppointAssembler.swift
//  MyClient
//
//  Created by Leonid Fedorov on 19.05.2023.
//

import Foundation
import Swinject

class MyAppointAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(MyAppointVC.self) { r in
            let viewController = MyAppointVC(nibName: "MyAppointVC", bundle: nil)
//            let interactor = MyAppointVCInteractor()
//            let presenter = MyAppointVCPresenter()
//            let router = MyAppointVCRouter()
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
