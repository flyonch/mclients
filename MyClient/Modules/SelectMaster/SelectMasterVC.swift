//
//  SelectMasterVC.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//
//не по технологии viper слишком мелкий контроллер

import UIKit

class SelectMasterVC: UIViewController {
    weak var delegate: SelectServiceDelegate?

    
    @IBOutlet var mainTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainTable.dataSource = self
        mainTable.delegate = self
        mainTable.register(UINib(nibName: "MasterCustomCell", bundle: nil), forCellReuseIdentifier: "MasterCustomCell")
        
        getAllService()
    }
    
    var apiDatasource = ServiceApiDatasource()
    var dataService: [serviceManager] = []
    var service_id: Int?
    
    func getAllService() {
        if  let service_id = service_id {
            let observable = apiDatasource.getServiceManager(service_id: service_id)
            
            observable.subscribe(onNext: { [self] data in
                dataService = data
                print("Data masterService Complite😼")
                mainTable.reloadData()
                
            }, onError: { error in
                print("Error occurred: \(error.localizedDescription)")
                CustomAlert.showAlert(withTitle: "Ошибка", message: error.localizedDescription , actionTitle: "OK", cancelTitle: "Отмена")
            })
        } else {
            navigationController?.dismiss(animated: true)
        }
    }
}


extension SelectMasterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterCustomCell", for: indexPath) as! MasterCustomCell
        cell.textsLabel.text = dataService[indexPath.row].user_fullname
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // вернуть желаемую высоту
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data: serviceManager = dataService[indexPath.row]
        delegate?.didSelectMaster(master: data)
        dismiss(animated: true, completion: nil)
    }
}
