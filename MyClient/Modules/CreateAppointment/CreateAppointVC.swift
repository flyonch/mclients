//
//  CreateAppointmentVC.swift
//  MyClient
//
//  Created by Leonid Fedorov on 15.05.2023.
//

import UIKit

class CreateAppointVC: UIViewController, SelectServiceDelegate {
    @IBOutlet var mainImage: UIImageView!
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var typeServiceBtn: UIButton!
    @IBOutlet var dateBtn: UIButton!
    @IBOutlet var selectMasterBtn: UIButton!
    @IBOutlet var selectNext: UIButton!
    @IBOutlet var selectDateBtn: UIButton!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var viewBtn: UIView!
    
    var typeVC: ServiceModel?
    var typeServiceId: Int?

    
    var selectTypeService: PodServiceModel?
    var selectMaster: serviceManager?
    var selectDate: String?
    var selectTime: String?
    var allPrice: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBtnState()
    }

    
    // передаем параметры из homeVC
    func config(data: [ServiceModel], typeServiceId: Int) {
        typeVC = data.first(where: { $0.type_services_id == typeServiceId + 1 })
        self.typeServiceId = typeServiceId
    }
    
    func setupUI() {
        mainLabel.text = typeVC?.type_service_name
        selectMasterBtn.isEnabled = false
        selectDateBtn.isEnabled = false
        viewBtn.isHidden = true
    }
    
    func setupBtnState() {
        if (selectTypeService != nil) {
            selectMasterBtn.isEnabled = true
        }

        if (selectMaster != nil) {
            selectDateBtn.isEnabled = true
        }
        
        if (selectDate != nil) {
            viewBtn.isHidden = false
        }
    }
    
    // получаем данные из подсервисов
    func didSelectService(service: PodServiceModel) {
        self.selectTypeService = service
        typeServiceBtn.setTitle(selectTypeService?.name_service, for: .normal)
        allPrice = selectTypeService?.price
        priceLabel.text = allPrice
        
        setupBtnState()
    }
    
    func didSelectMaster(master: serviceManager) {
        self.selectMaster = master
        selectMasterBtn.setTitle(selectMaster?.user_fullname, for: .normal)
        
        setupBtnState()
    }
    
    func didSelectDate(date: String, time: String) {
        selectDate = date
        selectTime = time
        
        selectDateBtn.setTitle(selectDate, for: .normal)
        setupBtnState()
    }
    

    
    @IBAction func selectTypeServiceAction(_ sender: Any) {
        let vc = SelectServiceVC()
        vc.typeServiceId = self.typeServiceId! + 1
        vc.delegate = self
        self.navigationController?.present(vc, animated: true)
    }
    
    @IBAction func selectDateActionBtn(_ sender: Any) {
        let vc = SelectTimeVC()
        // передаем id менеджера
        vc.selectManagerId = selectMaster!.user_id
        vc.delegate = self
        self.navigationController?.present(vc, animated: true)
    }

    @IBAction func selectMasterBtn(_ sender: Any) {
        let vc = SelectMasterVC()
        vc.service_id = typeVC?.type_services_id
        vc.delegate = self
        self.navigationController?.present(vc, animated: true)
    }
    
    @IBAction func nextActionBtn(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: selectDate!)

        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let formattedDateString = dateFormatter.string(from: date!)

        
        let userId = UserManager.getUserId().userId
        
        var serviceId = selectTypeService?.service_id!
        var manager_id = selectMaster?.user_id!
        var date_form = formattedDateString
        var time_form = selectTime!
        
        
        let api = ServiceApiDatasource()

        let observable = api.postAppoint(user_id: userId!, manager_id: manager_id!, service_id: serviceId!, date_time_service: date_form, selectTime: time_form)
        
        observable.subscribe(onNext: { [self] data in
            print("Data ccreateApp Complite😼")
            present(SuccseccVC(), animated: true)
            navigationController?.popViewController(animated: false)
            
        }, onError: { error in
            print("Error occurred: \(error.localizedDescription)")
        })
    }

    
}


// MARK: - Protocols

protocol SelectServiceDelegate: AnyObject {
    func didSelectService(service: PodServiceModel)
    func didSelectMaster(master: serviceManager)
    func didSelectDate(date: String, time: String)
}
