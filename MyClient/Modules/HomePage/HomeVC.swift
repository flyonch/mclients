//
//  HomeVCViewController.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//

import UIKit
import RxSwift
import Rideau
import Swinject


class HomeVC: UIViewController, HomeViewProtocol {
    // MARK: - Variables
    var presenter: HomePresenterProtocol?
    var navigation: UINavigationController?
    
    @IBOutlet var topViewUser: UIView!
    @IBOutlet var collectionAppoint: UICollectionView!
    @IBOutlet var avatarImg: UIImageView!
    
    @IBOutlet var userNamePrew: UILabel!
    @IBOutlet var userPhonePew: UILabel!
    
    let apiDatasource = UserApiDatasource()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setupUI()
        setupRiadeu()
        registerCell()
    }
    
    
    //регаем ячейки для коллеций и таблиц
    func registerCell() {
        collectionAppoint.register(UINib(nibName: "AppointViewCell", bundle: nil), forCellWithReuseIdentifier: "AppointViewCell")
        
        collectionAppoint.dataSource = self
        collectionAppoint.delegate = self
        
    }
    
    //конфиг Riadeu
    func setupRiadeu() {
        let rideauView = RideauView(frame: .zero, configuration: .init(modify: { (config) in
            // ограничения для rideauView
            config.snapPoints = [.fraction(0.87), .fraction(1)]
            config.scrollViewOption.scrollViewDetection = .automatic

        }))
        
        view.addSubview(rideauView)
        rideauView.frame = view.bounds
        rideauView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
        let controller = RiadeuVC(nibName: "RiadeuVC", bundle: nil)

        let container = RideauMaskedCornerRoundedViewController()
        container.isThumbVisible = true
        container.setBodyViewController(controller)
        container.willMove(toParent: self)
        addChild(container)
        
        rideauView.containerView.set(bodyView: container.view, resizingOption: .resizeToVisibleArea)
        rideauView.isTrackingKeyboard = false
        rideauView.delegate = self
    }
     
    func getData() {
        presenter?.getAllService()
        presenter?.getUserProfile()
    }
    
    
    func setupUI(){
        title = "Главная"
        
//        navigationController?.navigationBar.isHidden = true
        //лейаут у коллеции по размеру ячейки xib custom
        if let flowLayout = collectionAppoint?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        collectionAppoint.isPagingEnabled = true

        topViewUser.layer.cornerRadius = 12
        avatarImg.layer.cornerRadius = 30
        
        // кастомная кнопка выхода
        let customButton = UIButton(type: .custom)
        customButton.setImage(UIImage(systemName: "forward.frame"), for: .normal)
        customButton.addTarget(self, action: #selector(exitTapped), for: .touchUpInside)
        
        let customBarButtonItem = UIBarButtonItem(customView: customButton)
        
        navigationItem.rightBarButtonItem = customBarButtonItem
    }
    
    //TODO: в презентер
    @objc func exitTapped() {
        CustomAlert.showAlert(withTitle: "Выход", message: "Вы уверены, что хотите выйти?", actionTitle: "Ок", cancelTitle: "Отмена") {
            // Действие после нажатия на кнопку "Ок"
            print("Пользователь нажал Ок")
            // Удаление всех данных из UserDefaults
            UserManager.removeAllData()
            
            // Создание экземпляра AuthViewController
            let container = ApplicationAssembly.assembler.resolver as! Container
            let authViewController = container.resolve(AuthViewController.self)

            
            // установка AuthVC в качестве корневого контроллера навигации
            let navigationController = UINavigationController(rootViewController: authViewController!)
            UIApplication.shared.keyWindow?.rootViewController = navigationController
            
            // переход на экран логина
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
            UIView.transition(with: UIApplication.shared.keyWindow!, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        } cancelHandler: {
            // действие после нажатия на кнопку "Отмена"
            print("Пользователь нажал Отмена")
        }
    }

    func setupProfile(){
        userNamePrew.text = UserDataManagerProfile.shared.getData().userFullName ?? "USER_NAME"
        userPhonePew.text = UserDataManagerProfile.shared.getData().userPhone ?? "PHONE"
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppointViewCell", for: indexPath) as! AppointViewCell
        return cell
    }
    
    
}

extension HomeVC : RideauViewDelegate {
  func rideauView(_ rideauView: RideauView, animatorsAlongsideMovingIn range: ResolvedSnapPointRange) -> [UIViewPropertyAnimator] {
    
    switch (range.start.source, range.end.source) {
        
    case (.fraction(1), .fraction(0.7)):
      
      return []
      
    case (.fraction(0.7), .autoPointsFromBottom):
      return []
    default:
      return []
    }
  }
  
  func rideauView(_ rideauView: RideauView, willMoveTo snapPoint: RideauSnapPoint) {

  }
  
  func rideauView(_ rideauView: RideauView, didMoveTo snapPoint: RideauSnapPoint) {

  }
  
  
}
