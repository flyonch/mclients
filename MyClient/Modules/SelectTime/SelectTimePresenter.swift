//
//  SelectTimePresenter.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import Foundation

import UIKit

class SelectTimePresenter: SelectTimePresenterProtocol, SelectTimeInteractorOutputProtocol {
    var view: SelectTimeViewProtocol?
    var interactor: SelectTimeInteractorInputProtocol?
    var router: SelectTimeRouterProtocol?
    
}

