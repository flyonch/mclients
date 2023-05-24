//
//  RegistrationVC.swift
//  MyClient
//
//  Created by Leonid Fedorov on 08.05.2023.
//

import UIKit

class RegistrationVC: UIViewController, RegistrationViewProtocol {
    // MARK: - Variables
    var presenter: RegistrationPresenterProtocol?
    var navigation: UINavigationController?

    
    // MARK: - UI Components
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var customBtnAccept: UIButton!
    @IBOutlet var btnRegistration: UIButton!
    @IBOutlet var backToLogin: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI Setup
    func setupUI() {
        
    }
    
    // MARK: - Selectors
    
    // MARK: - Function
    @IBAction func actionBtnReg(_ sender: Any) {
        presenter?.activeTest()
    }
    
    @IBAction func backToLoginAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
