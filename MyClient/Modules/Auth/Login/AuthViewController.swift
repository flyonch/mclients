//
//  ViewController.swift
//  MyClient
//
//  Created by Leonid Fedorov on 07.05.2023.
//

import UIKit

class AuthViewController: UIViewController ,AuthViewProtocol {
    

    // MARK: - Variables
    var presenter: AuthPresenterProtocol?
    var navigation: UINavigationController?

    

    
    // MARK: - UI Components
    
    @IBOutlet var logo: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailTextFiled: UITextField!
    @IBOutlet var passwdTextField: UITextField!
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var btnReg: UIButton!
    @IBOutlet var btnResetPasswd: UIButton!
    
    
    @IBOutlet var botLabelText: UILabel!
    @IBOutlet var buildVersionLabel: UILabel!
    
    // MARK: - UI Setup
    func setupUI(){
        // запрос к апи с получаением данных профиля
    }
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigation = navigationController
        setupUI()
    }
    
    // MARK: - Function
    
    @IBAction func btnLoginActions(_ sender: Any) {
        
        presenter?.checkLogin(email: emailTextFiled.text ?? "", password: passwdTextField.text ?? "")
    }
    
    
    @IBAction func btnRegAction(_ sender: Any) {
        presenter?.navigateToRegistration(vc: self)

    }
    
    @IBAction func btnResetAction(_ sender: Any) {
//        presenter?.vcActive()

    }
    
    // MARK: - Selectors
}
