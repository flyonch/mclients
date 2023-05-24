//
//  mainVC.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//
//Корневой контроллер содержащий ТабБар для размещения VC
//TODO: убрать кнопку back

import UIKit
import Swinject


// вкладки
enum Tabs: Int {
    case home
    case appointmens
    case profile
    case settings
}

class MainVC: UITabBarController {
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
//        let userData = UserManager.getUserId()
//        getProfileUser(userId: userData.userId!)
        
        config()
    }
    
    // перерисовка интерфейса при инициализации 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func config() {
        tabBar.tintColor = UIColor.systemBlue
        tabBar.barTintColor = UIColor.systemCyan
        tabBar.backgroundColor = UIColor.white
//
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        //контейнеры для swinjetAssembler
        
        let containerHome = ApplicationAssembly.assembler.resolver as! Container
        let vcHome = containerHome.resolve(HomeVC.self)
        
        let containerAppointmens = ApplicationAssembly.assembler.resolver as! Container
        let vcAppointmens = containerAppointmens.resolve(MyAppointVC.self)
        
        let containerProfile = ApplicationAssembly.assembler.resolver as! Container
        let vcProfile = containerProfile.resolve(HomeVC.self)
        
        let containerSettings = ApplicationAssembly.assembler.resolver as! Container
        let vcSettings = containerSettings.resolve(HomeVC.self)
        
        
        
        let homeVC = vcHome
        let appointmensVC = vcAppointmens
        let profileVC = vcProfile
        let settingsVC = vcSettings
        

                
        let homeVCNavigation = UINavigationController(rootViewController: homeVC!)
        let appointmensNavigation = UINavigationController(rootViewController: appointmensVC!)
//        let profileNavigation = UINavigationController(rootViewController: profileVC!)
//        let settingsNavigation = UINavigationController(rootViewController: settingsVC!)

        
        homeVC!.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), tag: Tabs.home.rawValue)
        appointmensVC!.tabBarItem = UITabBarItem(title: "Мои заявки", image: UIImage(systemName: "list.clipboard"), tag: Tabs.appointmens.rawValue)
//        profileVC!.tabBarItem = UITabBarItem(title: "Мой профиль", image: UIImage(systemName: "person"), tag: Tabs.profile.rawValue)
//        settingsVC!.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage(systemName: "gearshape"), tag: Tabs.settings.rawValue)

        
        setViewControllers([homeVCNavigation,appointmensNavigation], animated: true)
//        setViewControllers([homeVCNavigation,appointmensNavigation,profileNavigation,settingsNavigation], animated: true)

        
    }
    
//    // получаем профиль юзера по id из токена перенести в presenter
//    func getProfileUser(userId: Int) {
//        let apiDatasource = UserApiDatasource()
//        let data = apiDatasource.getUserData(userId: userId)
//        data.subscribe(onNext: { data in
//
//            UserDataManagerProfile.shared.saveData(
//                userId: data.user_id,
//                userFullName: data.user_fullname,
//                userPhone: data.user_phone,
//                userEmail: data.user_email,
//                isActivated: data.isactivated!,
//                userRole: data.userrole,
//                avatarURL: data.avatarurl
//            )
//
//        }, onError: { error in
//            print(error)
//        })
//    }
}
