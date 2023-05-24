//
//  AuthProtocols.swift
//  MyClient
//
//  Created by Leonid Fedorov on 07.05.2023.
//

import Foundation
import UIKit


//MARK: Assembler -
protocol AuthAssemblerProtocol {
    
}

//MARK: Presenter -
protocol AuthPresenterProtocol: AnyObject {
    var view: AuthViewProtocol? { get set }
    var interactor: AuthInteractorInputProtocol? { get set }
    var router: AuthRouterProtocol? { get set }

    func navigateToRegistration(vc: UIViewController)
    func checkLogin(email: String, password: String)

}

//MARK: Interactor - Output
protocol AuthInteractorOutputProtocol: AnyObject {
    
    func navigationToMainVC(data: tokenModel)
    
    /* Interactor -> Presenter */
}

//MARK: Interactor - Input
protocol AuthInteractorInputProtocol: AnyObject {
    
    var presenter: AuthInteractorOutputProtocol?  { get set }
    
    func getToken(email: String, password: String)
    func getRefresh()

    /* Presenter -> Interactor */
}

//MARK: Router
protocol AuthRouterProtocol: AnyObject {
    
    func navigateToRegistration(vc: UIViewController)
    func navigateToMain()

    /* Presenter -> Router */
}

//MARK: View -
protocol AuthViewProtocol: AnyObject {
    var presenter: AuthPresenterProtocol?  { get set }
    var navigation: UINavigationController? { get set }
    

    /* Presenter -> ViewController */
}
