//
//  RegistrationRouter.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//

import Foundation
import LiteRoute
import Swinject
//import Rideau

class RegistrationRouter: RegistrationRouterProtocol {
    
    weak var transitionHandler: TransitionHandler?
    var view: RegistrationViewProtocol?
    
//    func navigateToRegistration(vc: UIViewController) {
//        let container = ApplicationAssembly.assembler.resolver as! Container
//        let vc = container.resolve(RegistrationVC.self)
////        vc?.modalPresentationStyle = .formSheet // выбираем стиль модального перехода
////        vc?.modalTransitionStyle = .crossDissolve // выбираем стиль анимации перехода
//
////        view?.navigation?.pushViewController(vc!, animated: true)
//        view?.navigation?.present(vc!, animated: true)
//    }

    
}
