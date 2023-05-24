//
//  AppCoordinator.swift
//  MyClient
//
//  Created by Leonid Fedorov on 10.05.2023.
//
// кординирует начальные экраны приложения(корневые) установленные в SceneDelegate

import Foundation
import UIKit

class AppCoordinator {
    
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigateToTabBar() {
        let tabBarController = MainVC()
        let navController = UINavigationController(rootViewController: tabBarController)
        navController.modalPresentationStyle = .fullScreen // выбираем стиль модального перехода
        self.window.rootViewController = navController
        self.window.makeKeyAndVisible()
    }
    
    func loginScreen() {
        let authVC = ApplicationAssembly.assembler.resolver.resolve(AuthViewController.self)!
        let navController = UINavigationController(rootViewController: authVC)
        navController.modalPresentationStyle = .fullScreen // выбираем стиль модального перехода
        self.window.rootViewController = navController
        self.window.makeKeyAndVisible()
        
//        let tabBarController = MainVC()
//        let navController = UINavigationController(rootViewController: tabBarController)
//        navController.modalPresentationStyle = .fullScreen // выбираем стиль модального перехода
//        self.window.rootViewController = navController
//        self.window.makeKeyAndVisible()
    }
    
}
