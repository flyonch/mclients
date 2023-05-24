//
//  HomeProtocol.swift
//  MyClient
//
//  Created by Leonid Fedorov on 15.05.2023.
//

import Foundation
import UIKit


//MARK: Assembler -
protocol HomeAssemblerProtocol {
    
}

//MARK: Presenter -
protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func loadData(data: [ServiceModel])
    func getAllService()
    func getUserProfile()
    
    var allService: [ServiceModel] { get set }
}

//MARK: Interactor - Output
protocol HomeInteractorOutputProtocol: AnyObject {
        
    func loadData(data: [ServiceModel])

    
    /* Interactor -> Presenter */
}

//MARK: Interactor - Input
protocol HomeInteractorInputProtocol: AnyObject {
    
    var presenter: HomeInteractorOutputProtocol?  { get set }
    
    func getAllService()
    
    /* Presenter -> Interactor */
}

//MARK: Router
protocol HomeRouterProtocol: AnyObject {
    
    /* Presenter -> Router */
}

//MARK: View -
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol?  { get set }
    func setupProfile()
    
    /* Presenter -> ViewController */
}
