//
//  CreateAppointProtocol.swift
//  MyClient
//
//  Created by Leonid Fedorov on 15.05.2023.
//

import Foundation
import UIKit


//MARK: Assembler -
protocol CreateAppointAssemblerProtocol {
    
}

//MARK: Presenter -
protocol CreateAppointPresenterProtocol: AnyObject {
    var view: CreateAppointViewProtocol? { get set }
    var interactor: CreateAppointInteractorInputProtocol? { get set }
    var router: CreateAppointRouterProtocol? { get set }


}

//MARK: Interactor - Output
protocol CreateAppointInteractorOutputProtocol: AnyObject {
    
    
    /* Interactor -> Presenter */
}

//MARK: Interactor - Input
protocol CreateAppointInteractorInputProtocol: AnyObject {
    
    var presenter: CreateAppointInteractorOutputProtocol?  { get set }
    


    /* Presenter -> Interactor */
}

//MARK: Router
protocol CreateAppointRouterProtocol: AnyObject {
    


    /* Presenter -> Router */
}

//MARK: View -
protocol CreateAppointViewProtocol: AnyObject {
    var presenter: CreateAppointPresenterProtocol?  { get set }
    

    /* Presenter -> ViewController */
}
