//
//  SelectMasterAssembler.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import Foundation
import Swinject

class SelectMasterAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(SelectMasterVC.self) { r in
            let viewController = SelectMasterVC(nibName: "SelectMaster", bundle: nil)
//            let interactor = <#VCNAME#>Interactor()
//            let presenter = <#VCNAME#>Presenter()
//            let router = <#VCNAME#>Router()
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
