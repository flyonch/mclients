//
//  RegistrationProtocol.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//

import Foundation
import UIKit


//MARK: Assembler -
protocol RegistrationAssemblerProtocol {
    
}

//MARK: Presenter -
protocol RegistrationPresenterProtocol: AnyObject {
    var view: RegistrationViewProtocol? { get set }
    var interactor: RegistrationInteractorInputProtocol? { get set }
    var router: RegistrationRouterProtocol? { get set }

    func activeTest()
}

//MARK: Interactor - Output
protocol RegistrationInteractorOutputProtocol: AnyObject {
    
    /* Interactor -> Presenter */
}

//MARK: Interactor - Input
protocol RegistrationInteractorInputProtocol: AnyObject {
    
    var presenter: RegistrationInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: Router
protocol RegistrationRouterProtocol: AnyObject {
    

    /* Presenter -> Router */
}

//MARK: View -
protocol RegistrationViewProtocol: AnyObject {
    var presenter: RegistrationPresenterProtocol?  { get set }
    var navigation: UINavigationController? { get set }
    

    /* Presenter -> ViewController */
}
