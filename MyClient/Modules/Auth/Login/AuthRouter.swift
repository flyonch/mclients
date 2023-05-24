//
//  AuthRouter.swift
//  MyClient
//
//  Created by Leonid Fedorov on 07.05.2023.
//

import Foundation
import LiteRoute
import Swinject
//import Rideau

class AuthRouter: AuthRouterProtocol {
    
    weak var transitionHandler: TransitionHandler?
    var view: AuthViewProtocol?
    
    func navigateToRegistration(vc: UIViewController) {
        let container = ApplicationAssembly.assembler.resolver as! Container
        let vc = container.resolve(RegistrationVC.self)
//        vc?.modalPresentationStyle = .formSheet // выбираем стиль модального перехода
//        vc?.modalTransitionStyle = .crossDissolve // выбираем стиль анимации перехода

//        view?.navigation?.pushViewController(vc!, animated: true)
        view?.navigation?.present(vc!, animated: true)
    }
    
    func navigateToMain() {
        let container = ApplicationAssembly.assembler.resolver as! Container
        let vc = container.resolve(MainVC.self)
//        vc?.modalPresentationStyle = .formSheet // выбираем стиль модального перехода
//        vc?.modalTransitionStyle = .crossDissolve // выбираем стиль анимации перехода

        view?.navigation?.pushViewController(vc!, animated: true)
//        view?.navigation?.present(vc!, animated: true)
        view?.navigation?.dismiss(animated: true)

    }

    
}
