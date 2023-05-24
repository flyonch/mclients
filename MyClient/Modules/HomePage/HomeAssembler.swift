//
//  HomeAssembler.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//

import Foundation
import Swinject

class HomeAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(HomeVC.self) { r in
            let viewController = HomeVC(nibName: "HomeVC", bundle: nil)
            let interactor = HomeInteractor()
            let presenter = HomePresenter()
            let router = HomeRouter()
                        
            interactor.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = viewController
            router.view = viewController
            viewController.presenter = presenter
            
            return viewController
        }
    }
}
