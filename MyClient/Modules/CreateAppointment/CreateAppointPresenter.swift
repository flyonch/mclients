//
//  CreateAppointPresenter.swift
//  MyClient
//
//  Created by Leonid Fedorov on 15.05.2023.
//

import Foundation
import UIKit

class CreateAppointPresenter: CreateAppointPresenterProtocol, CreateAppointInteractorOutputProtocol {
    var view: CreateAppointViewProtocol?
    var interactor: CreateAppointInteractorInputProtocol?
    var router: CreateAppointRouterProtocol?

}
