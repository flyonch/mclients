//
//  SceneDelegate.swift
//  MyClient
//
//  Created by Leonid Fedorov on 07.05.2023.
//

import UIKit
import Swinject
import RxSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    static var shared: SceneDelegate?

    var window: UIWindow?
    var assembler: Assembler!
    var coordinator: AppCoordinator?
    var isAuthenticated: Bool = false

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        var window = UIWindow(windowScene: windowScene)
        coordinator = AppCoordinator(window: window)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.delegate = self
        if isAuthenticated {
            coordinator?.navigateToTabBar()
        } else {
            coordinator?.loginScreen()
        }
    }
}

extension SceneDelegate: AppDelegateDelegate {
    func didFinishAuthentication(isAuthenticated: Bool) {
        self.isAuthenticated = isAuthenticated
        if isAuthenticated {
            coordinator?.navigateToTabBar()
        } else {
            coordinator?.loginScreen()
        }
    }
}
