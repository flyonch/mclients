//
//  SelectTimeProtocol.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import Foundation
import UIKit


//MARK: Assembler -
protocol SelectTimeAssemblerProtocol {
    
}

//MARK: Presenter -
protocol SelectTimePresenterProtocol: AnyObject {
    var view: SelectTimeViewProtocol? { get set }
    var interactor: SelectTimeInteractorInputProtocol? { get set }
    var router: SelectTimeRouterProtocol? { get set }
    
    
}

//MARK: Interactor - Output
protocol SelectTimeInteractorOutputProtocol: AnyObject {
    
    /* Interactor -> Presenter */
}

//MARK: Interactor - Input
protocol SelectTimeInteractorInputProtocol: AnyObject {
    var presenter: SelectTimeInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: Router
protocol SelectTimeRouterProtocol: AnyObject {
    
    /* Presenter -> Router */
}

//MARK: View -
protocol SelectTimeViewProtocol: AnyObject {
    var presenter: SelectTimePresenterProtocol?  { get set }
    var navigation: UINavigationController? { get set }

    
    /* Presenter -> ViewController */
}
